//
//  VerifyPhoneView.swift
//  vican
//
//  Created by m00nbek on 12/9/23.
//

import SwiftUI

struct VerifyPhoneView: View {
    @EnvironmentObject private var appRootManager: AppRootManager
    @ObservedObject private var viewModel: ViewModel
    @FocusState private var keyboardFocus: Bool
    
    init(phoneNumber: String, authProvider: AuthService) {
        self.viewModel = ViewModel(phoneNumber: phoneNumber, authProvider: authProvider)
    }

    var body: some View {
        ZStack {
            VStack {
                Image(systemName: "lock.shield")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 160, height: 160)
                    .padding()
                
                Text("Verify your phone number")
                    .font(.title2)
                    .fontWeight(.semibold)
                
                Text("Enter the 6 digit code you received")
                    .font(.caption)
                    .fontWeight(.thin)
                    .padding(.top)
                
                VerifyCodeInputView(inputCode: $viewModel.inputCode, digits: $viewModel.digits, keyboardFocus: _keyboardFocus)
                
                Button {
                    viewModel.verifyPhoneNumber()
                } label: {
                    Spacer()
                    Text("Verify")
                        .font(.system(.title3, design: .rounded))
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                    Spacer()
                }
                .padding(15)
                .background(Color.blue)
                .clipShape(Capsule())
                .padding()
                .opacity(viewModel.isVerificationEnabled ? 1 : 0.5)
                .disabled(!viewModel.isVerificationEnabled)
            }
            .alert(isPresented: Binding(
                get: { viewModel.errorAlert != nil },
                set: { _ in viewModel.errorAlert = nil }
            )) {
                let alert = viewModel.errorAlert!
                return alert
            }
            
            if viewModel.isLoading {
                Color.black.opacity(0.5)
                    .edgesIgnoringSafeArea(.all)
                
                ProgressView("Verifying...")
                    .progressViewStyle(CircularProgressViewStyle(tint: .white))
                    .foregroundStyle(.white)
            }
        }
        .onChange(of: viewModel.isLoading) { newValue in
            if newValue {
                keyboardFocus = false
            }
        }
        .onChange(of: viewModel.presentHome) { newValue in
            if newValue {
                withAnimation(.easeInOut(duration: 1)) {
                    appRootManager.currentRoot = .home
                }
            }
        }
    }
}
