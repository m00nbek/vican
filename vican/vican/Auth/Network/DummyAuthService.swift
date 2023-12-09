//
//  DummyAuthService.swift
//  vican
//
//  Created by m00nbek on 12/10/23.
//

import Foundation

class DummyAuthService: AuthService {
    func sendOtp(to phoneNumber: String, completion: @escaping (Result<Void, Error>) -> Void) {
        // Implement logic to send OTP to the provided phone number
        // For example, you might make a network request to your backend
        // and handle the result in the completion block
        // Simulating success for demonstration purposes
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) { [weak self] in
//            self?.completeWithAnyError(completion)
            self?.completionWithSuccess(completion, value: ())
        }
    }
    
    func loginWithOtp(phoneNumber: String, otp: String, completion: @escaping (Result<String, Error>) -> Void) {
        // Implement logic to verify OTP and perform login
        // For example, you might make a network request to your backend
        // and handle the result in the completion block
        // Simulating success for demonstration purposes
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) { [weak self] in
            guard let self else { return }
            
            completionWithSuccess(completion, value: dummyToken)
//            completeWithAnyError(completion)
        }
    }
    
    private func completeWithAnyError<T>(_ completion: @escaping (Result<T, Error>) -> Void) {
        completion(.failure(DummyError()))
    }
    
    private func completionWithSuccess<T>(_ completion: @escaping (Result<T, Error>) -> Void, value: T) {
        completion(.success(value))
    }
    
    var dummyToken: String { "DummyToken" }
    struct DummyError: Error {}
}
