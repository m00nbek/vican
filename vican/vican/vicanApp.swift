//
//  vicanApp.swift
//  vican
//
//  Created by m00nbek on 12/7/23.
//

import SwiftUI

@main
struct vicanApp: App {
    var body: some Scene {
        WindowGroup {
            if AuthManager.shared.isAuthorized {
                HomeView()
            } else {
                LoginView()
            }
        }
    }
}