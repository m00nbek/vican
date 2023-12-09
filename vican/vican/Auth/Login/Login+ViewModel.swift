//
//  LoginViewModel.swift
//  vican
//
//  Created by m00nbek on 12/8/23.
//

import Foundation
import Combine

extension LoginView {
    @MainActor class ViewModel: ObservableObject {
        @Published var isHomePresented: Bool = false
        @Published var phoneNumber: String = "+998"
        @Published var isSubmitEnabled: Bool = false
        
        private let authProvider: AuthProvider
        
        init(authProvider: AuthProvider) {
            self.authProvider = authProvider
        }
        
        // MARK: -
        func sendOtp() {
            // start loader
            authProvider.sendOtp(to: phoneNumber) { result in
                // stop loading
                switch result {
                case .success:
                    print("OTP sent successfully")
                case .failure(let error):
                    print("Failed to send OTP: \(error.localizedDescription)")
                }
            }
        }
        
        func formatPhoneNumber() {
            phoneNumber = phoneNumber.formatPhoneNumber()
        }
        
        func validateSubmitButton() {
            isSubmitEnabled = isValidPhoneNumber(phoneNumber)
        }
        
        func saveToken() {
            //        AppCore.shared.token = "token"
        }
        
        func showHome() {
            isHomePresented = true
        }
        
        // MARK: - Helpers
        private func isValidPhoneNumber(_ phoneNumber: String) -> Bool {
            let phoneNumberRegex = #"^\+\d{3} \(\d{2}\) \d{3}-\d{4}$"#
            return phoneNumber.isValid(regex: phoneNumberRegex)
        }
    }
}
