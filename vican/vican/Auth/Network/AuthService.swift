//
//  AuthService.swift
//  vican
//
//  Created by m00nbek on 12/10/23.
//

import Foundation

protocol AuthService {
    func sendOtp(to phoneNumber: String) async throws
    func loginWithOtp(phoneNumber: String, otp: String) async throws -> String
}
