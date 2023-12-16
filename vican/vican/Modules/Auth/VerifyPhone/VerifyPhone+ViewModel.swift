//
//  VerifyPhone+ViewModel.swift
//  vican
//
//  Created by m00nbek on 12/9/23.
//

import SwiftUI
import Combine

extension VerifyPhoneView {
    @MainActor class ViewModel: ObservableObject {
        @Published var inputCode: String = ""
        @Published var digits: [String] = Array(repeating: "", count: 6)
        @Published var isVerificationEnabled: Bool = false
        @Published var isLoading: Bool = false
        @Published var errorAlert: Alert?
        private let didFinishVerification: () -> Void
        private var cancellables: Set<AnyCancellable> = []
        
        // init
        private let phoneNumber: String
        private let authService: AuthService
        
        init(phoneNumber: String, authService: AuthService, didFinishVerification: @escaping () -> Void) {
            self.phoneNumber = phoneNumber
            self.authService = authService
            self.didFinishVerification = didFinishVerification
            
            // publishers
            $digits
                .map { $0.allSatisfy { $0.count == 1 } } // Check if all pins are filled
                .assign(to: \.isVerificationEnabled, on: self)
                .store(in: &cancellables)
            
            $inputCode
                .sink { newValue in
                    self.updateDigits(input: newValue)
                }
                .store(in: &cancellables)
            
            $isVerificationEnabled
                .sink { [weak self] newValue in
                    if newValue {
                        self?.verifyPhoneNumber()
                    }
                }
                .store(in: &cancellables)
        }
        
        // MARK: -
        func verifyPhoneNumber() {
            isLoading = true
            Task {
                defer { isLoading = false }
                
                do {
                    let token = try await authService.loginWithOtp(phoneNumber: phoneNumber, otp: inputCode)
                    saveToken(token)
                    didFinishVerification()
                } catch {
                    handleError(error)
                }
            }
        }
        
        func saveToken(_ token: String) {
            AppCore.shared.token = token
        }
        
        private func updateDigits(input: String) {
            let codeArray = Array(input)
            for i in digits.indices {
                if i < codeArray.count {
                    digits[i] = String(codeArray[i])
                } else {
                    digits[i] = ""
                }
            }
        }
        
        // MARK: - Helpers
        func handleError(_ error: Error) {
            errorAlert = Alert(title: Text("Error"), message: Text(error.localizedDescription), dismissButton: .default(Text("OK")))
        }
    }
}
