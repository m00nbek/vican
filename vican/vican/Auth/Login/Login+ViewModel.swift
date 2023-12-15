//
//  LoginViewModel.swift
//  vican
//
//  Created by m00nbek on 12/8/23.
//

import SwiftUI
import Combine

extension LoginView {
    @MainActor class ViewModel: ObservableObject {
        @Published var isVerifyPhonePresented: Bool = false
        @Published var phoneNumber: String = "+998"
        @Published var isSubmitEnabled: Bool = false
        @Published var isLoading: Bool = false
        @Published var errorAlert: Alert?
        
        private let authService: AuthService
        
        init(authService: AuthService) {
            self.authService = authService
        }
        
        // MARK: -
        func sendOtp() {
            isLoading = true
            Task {
                defer { isLoading = false }
                
                do {
                    try await authService.sendOtp(to: phoneNumber)
                    showVerifyPhoneView()
                } catch {
                    handleError(error)
                }
            }
        }
        
        func formatPhoneNumber() {
            phoneNumber = phoneNumber.formatPhoneNumber()
        }
        
        func validateSubmitButton() {
            isSubmitEnabled = isValidPhoneNumber(phoneNumber)
        }
        
        func showVerifyPhoneView() {
            isVerifyPhonePresented = true
        }
        
        func createVerifyPhoneView() -> some View {
            VerifyPhoneView(phoneNumber: phoneNumber, authService: authService)
        }
        
        // MARK: - Helpers
        func handleError(_ error: Error) {
            errorAlert = Alert(title: Text("Error"), message: Text(error.localizedDescription), dismissButton: .default(Text("OK")))
        }
        
        private func isValidPhoneNumber(_ phoneNumber: String) -> Bool {
            let phoneNumberRegex = #"^\+\d{3} \(\d{2}\) \d{3}-\d{4}$"#
            return phoneNumber.isValid(regex: phoneNumberRegex)
        }
    }
}
