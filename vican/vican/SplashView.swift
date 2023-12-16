//
//  SplashView.swift
//  vican
//
//  Created by m00nbek on 12/10/23.
//

import SwiftUI

struct SplashView: View {
    @EnvironmentObject private var appRootManager: AppRootManager
    
    private let characters = Array("Viçan")
    @State private var fadeOutAnimation = false
    @State private var textScaleAnimation = false
    @State private var dragValue = CGSize(width: .zero, height: -UIScreen.main.bounds.height)
    
    var body: some View {
        ZStack {
            LinearGradient(
                gradient: Gradient(colors: [Color.red, Color.blue]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea(.all)
            
            HStack(spacing: .zero) {
                ForEach(characters.indices, id: \.self) { num in
                    Text(String(characters[num]))
                        .padding(6)
                        .font(.custom("", size: 56, relativeTo: .largeTitle))
                        .scaleEffect(textScaleAnimation ? 1 : 0.5)
                        .offset(dragValue)
                        .foregroundColor(.white)
                        .animation(.default.delay(Double(num) / 10), value: textScaleAnimation)
                        .animation(.default.delay(Double(num) / 10), value: dragValue)
                }
            }
            .onAppear {
                Task { @MainActor in
                    dragValue = .zero
                    
                    try await Task.sleep(nanoseconds: 500_000_000)
                    textScaleAnimation.toggle()
                    
                    try await Task.sleep(nanoseconds: 1_000_000_000)
                    fadeOutAnimation = true
                    
                    try await Task.sleep(nanoseconds: 1_000_000_000)
                    appRootManager.currentRoot = AppCore.shared.isAuthorized ? .home : .auth
                }
            }
        }
        .scaleEffect(fadeOutAnimation ? 5 : 1)
        .opacity(fadeOutAnimation ? 0 : 1)
        .animation(.easeIn(duration: 1), value: fadeOutAnimation)
    }
}
