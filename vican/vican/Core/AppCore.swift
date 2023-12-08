//
//  AppCore.swift
//  vican
//
//  Created by m00nbek on 12/8/23.
//

import Foundation

class AppCore {
    static let shared = AppCore()
    private init() {}
    
    var isAuthorized: Bool {
        token != nil
    }
    
    var token: String? {
        get {
            UserDefaults.standard.string(forKey: UserDefaultsKeys.token)
        }
        set {
            UserDefaults.standard.setValue(newValue, forKey: UserDefaultsKeys.token)
        }
    }
    
    private enum UserDefaultsKeys {
        static let token = "token"
    }
}
