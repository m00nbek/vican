//
//  AuthService.swift
//  vican
//
//  Created by m00nbek on 12/10/23.
//

import Foundation

protocol AuthService {
    func sendOtp(to phoneNumber: String, completion: @escaping (Result<Void, Error>) -> Void)
    func loginWithOtp(phoneNumber: String, otp: String, completion: @escaping (Result<String, Error>) -> Void)
}
