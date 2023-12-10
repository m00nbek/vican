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
        @Published var presentHome: Bool = false
        @Published var pins: [String] = Array(repeating: "", count: 6)
        @Published var isVerificationEnabled: Bool = false
        @Published var isLoading: Bool = false
        @Published var errorAlert: Alert?
        private var cancellables: Set<AnyCancellable> = []
        
        // init
        private let phoneNumber: String
        private let authProvider: AuthService
        
        init(phoneNumber: String, authProvider: AuthService) {
            self.phoneNumber = phoneNumber
            self.authProvider = authProvider
            
            // Set up Combine Publisher to observe changes in the pin array
            $pins
                .map { $0.allSatisfy { $0.count == 1 } } // Check if all pins are filled
                .assign(to: \.isVerificationEnabled, on: self)
                .store(in: &cancellables)
        }
        
        // MARK: -
        func verifyPhoneNumber() {
            isLoading = true
            let otpCode = pins.joined()
            authProvider.loginWithOtp(phoneNumber: phoneNumber, otp: otpCode) { [weak self] result in
                self?.isLoading = false
                
                switch result {
                case .success(let token):
                    self?.saveToken(token)
                    self?.showHome()
                case .failure(let error):
                    self?.handleError(error)
                }
            }
        }
        
        func saveToken(_ token: String) {
            AppCore.shared.token = token
        }
        
        func showHome() {
            presentHome = true
        }
        
        // MARK: - Helpers
        func handleError(_ error: Error) {
            errorAlert = Alert(title: Text("Error"), message: Text(error.localizedDescription), dismissButton: .default(Text("OK")))
        }
    }
}
