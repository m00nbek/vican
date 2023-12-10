//
//  SplashView.swift
//  vican
//
//  Created by m00nbek on 12/10/23.
//

import SwiftUI

struct SplashView: View {
    
    @EnvironmentObject private var appRootManager: AppRootManager
    
    var body: some View {
        ZStack {
            Color.blue
                .ignoresSafeArea()
            
            Text("")
                .font(.title)
                .fontWeight(.semibold)
                .foregroundColor(.white)
        }
        
        .onAppear() {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                withAnimation(.easeInOut(duration: 1)) {
                    appRootManager.currentRoot = .auth
                }
            }
        }
    }
}
