//
//  AuthManager.swift
//  vican
//
//  Created by m00nbek on 12/8/23.
//

import Foundation

class AuthManager {
    static let shared = AuthManager()
    
    var isAuthorized: Bool {
        token != nil
    }
    
    var token: String? {
        get {
            UserDefaults.standard.string(forKey: tokenKey)
        }
        set {
            UserDefaults.standard.setValue(newValue, forKey: tokenKey)
        }
    }
    
    private let tokenKey = "Token"
    
    private init() {}
}
