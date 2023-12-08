//
//  LoginViewModel.swift
//  vican
//
//  Created by m00nbek on 12/8/23.
//

import Foundation
import Combine

class LoginViewModel: ObservableObject {
    @Published var isHomePresented: Bool = false
    @Published var phoneNumber: String = "+998"
    @Published var isSubmitEnabled: Bool = false

    init() {
        // TODO: init with
        // AuthProvider/Manager
        // Network manager
    }
    
    // MARK: - UI Events
    func loginDidTap() {
        saveToken()
        showHome()
    }
    
    func phoneDidChange() {
        // format phone number
        phoneNumber = phoneNumber.formatPhoneNumber()
        isSubmitEnabled = isValidPhoneNumber(phoneNumber)
    }
    
    // MARK: - Actions
    private func saveToken() {
//        AppCore.shared.token = "token"
    }
    
    private func showHome() {
        isHomePresented = true
    }
    
    // MARK: - Helpers
    private func isValidPhoneNumber(_ phoneNumber: String) -> Bool {
        let phoneNumberRegex = #"^\+\d{3} \(\d{2}\) \d{3}-\d{4}$"#
        return phoneNumber.isValid(regex: phoneNumberRegex)
    }
}
