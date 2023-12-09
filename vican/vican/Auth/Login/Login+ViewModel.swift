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
