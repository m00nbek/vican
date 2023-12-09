//
//  LoginView.swift
//  vican
//
//  Created by m00nbek on 12/8/23.
//

import SwiftUI

struct LoginView: View {
    @FocusState private var keyboardFocused: Bool
    @StateObject private var viewModel: ViewModel
    
    init(viewModel: ViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                
                Image(systemName: "person.circle.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 160, height: 160)
                    .padding()
                
                Spacer()
                
                Text("Enter your phone number")
                    .font(.title3)
                    .fontWeight(.bold)
                    .padding(.bottom, 8)
                
                TextField("Phone Number", text: $viewModel.phoneNumber)
                    .padding()
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(8)
                    .padding(.horizontal, 20)
                    .autocapitalization(.none)
                    .disableAutocorrection(true)
                    .keyboardType(.phonePad)
                    .focused($keyboardFocused)
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now()) {
                            keyboardFocused = true
                        }
                    }
                    .onChange(of: viewModel.phoneNumber) {
                        viewModel.formatPhoneNumber()
                        viewModel.validateSubmitButton()
                    }
                    .navigationDestination(isPresented: $viewModel.isHomePresented) {
                        VerifyPhoneView()
                    }
                
                Button(action: {
                    viewModel.saveToken()
                    viewModel.showHome()
                }) {
                    Text("Submit")
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(.blue)
                        .cornerRadius(8)
                        .padding(.horizontal, 20)
                }
                .disabled(!viewModel.isSubmitEnabled)
                .opacity(viewModel.isSubmitEnabled ? 1 : 0.5)
                
                Spacer()
                Spacer()
            }
            .navigationBarTitle("Login", displayMode: .inline)
        }
    }
}