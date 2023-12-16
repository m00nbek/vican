//
//  DummyAuthService.swift
//  vican
//
//  Created by m00nbek on 12/10/23.
//

import Foundation

class DummyAuthService: AuthService {
    func sendOtp(to phoneNumber: String) async throws {
        try await Task.sleep(nanoseconds: 1 * 1_500_000_000)
        
//        throw DummyError()
    }
    
    func loginWithOtp(phoneNumber: String, otp: String) async throws -> String {
        try await Task.sleep(nanoseconds: 1 * 1_500_000_000)
        
        return dummyToken
    }
    
    var dummyToken: String { "DummyToken" }
    struct DummyError: Error {}
}
