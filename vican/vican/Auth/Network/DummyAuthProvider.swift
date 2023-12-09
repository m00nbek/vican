//
//  DummyAuthProvider.swift
//  vican
//
//  Created by m00nbek on 12/10/23.
//

import Foundation

class DummyAuthProvider: AuthProvider {
    func sendOtp(to phoneNumber: String, completion: @escaping (Result<Void, Error>) -> Void) {
        // Implement logic to send OTP to the provided phone number
        // For example, you might make a network request to your backend
        // and handle the result in the completion block
        // Simulating success for demonstration purposes
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            completion(.success(()))
        }
    }
    
    func loginWithOtp(phoneNumber: String, otp: String, completion: @escaping (Result<String, Error>) -> Void) {
        // Implement logic to verify OTP and perform login
        // For example, you might make a network request to your backend
        // and handle the result in the completion block
        // Simulating success for demonstration purposes
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            let authToken = "your_generated_auth_token"
            completion(.success(authToken))
        }
    }
}
