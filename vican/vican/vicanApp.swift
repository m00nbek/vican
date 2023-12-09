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
            if AppCore.shared.isAuthorized {
                HomeView()
            } else {
                let authProvider = DummyAuthProvider()
                LoginView(viewModel: .init(authProvider: authProvider))
            }
        }
    }
}
