//
//  AuthFlow.swift
//  vican
//
//  Created by m00nbek on 12/17/23.
//

import SwiftUI

struct AuthFlow {
    private let authService: AuthService
    private let didFinishVerification: () -> Void
    
    init(authService: AuthService, didFinishVerification: @escaping () -> Void) {
        self.authService = authService
        self.didFinishVerification = didFinishVerification
    }
    
    @MainActor 
    func start() -> some View {
        LoginView(viewModel: .init(authService: authService, didFinishVerification: didFinishVerification))
    }
}
