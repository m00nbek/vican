//
//  VerifyPhone+ViewModel.swift
//  vican
//
//  Created by m00nbek on 12/9/23.
//

import Foundation
import Combine

extension VerifyPhoneView {
    @MainActor class ViewModel: ObservableObject {
        @Published var pins: [String] = Array(repeating: "", count: 6)
        @Published var isVerificationEnabled: Bool = false
        
        private var cancellables: Set<AnyCancellable> = []
        
        // init
        private let phoneNumber: String
        private let authProvider: AuthProvider
        
        init(phoneNumber: String, authProvider: AuthProvider) {
            self.phoneNumber = phoneNumber
            self.authProvider = authProvider
            
            // Set up Combine Publisher to observe changes in the pin array
            $pins
                .map { $0.allSatisfy { $0.count == 1 } } // Check if all pins are filled
                .assign(to: \.isVerificationEnabled, on: self)
                .store(in: &cancellables)
        }
        
        func verifyPhoneNumber() {
            // Add your API request logic here
            print("Verifying phone number with pins: \(pins.joined())")
        }
    }
}
