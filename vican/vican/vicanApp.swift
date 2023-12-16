//
//  vicanApp.swift
//  vican
//
//  Created by m00nbek on 12/7/23.
//

import SwiftUI

@main
struct vicanApp: App {
    @StateObject private var appRootManager = AppRootManager()
    
    var body: some Scene {
        WindowGroup {
            Group {
                switch appRootManager.currentRoot {
                case .splash:
                    SplashView()
                    
                case .auth:
                    let authService = DummyAuthService()
                    AuthFlow(authService: authService) {
                        appRootManager.currentRoot = .home
                    }.start()
                    
                case .home:
                    HomeView()
                }
            }
            .environmentObject(appRootManager)
        }
    }
}
