//
//  LoginView.swift
//  vican
//
//  Created by m00nbek on 12/8/23.
//

import SwiftUI

struct LoginView: View {
    @State private var username: String = ""
    @State private var password: String = ""
    
    // Add state variable for login button
    @State private var isLoginEnabled = false
    
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                
                Image(systemName: "person.circle.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 100, height: 100)
                    .padding()
                
                TextField("Username", text: $username)
                    .padding()
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(8)
                    .padding(.horizontal, 20)
                    .autocapitalization(.none)
                    .disableAutocorrection(true)
                    .onChange(of: username) {
                        // Add validation logic for the username
                        updateLoginButtonState()
                    }
                
                SecureField("Password", text: $password)
                    .padding()
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(8)
                    .padding(.horizontal, 20)
                    .onChange(of: password) {
                        // Add validation logic for the password
                        updateLoginButtonState()
                    }
                
                NavigationLink(destination: Text("Forgot Password?")) {
                    Text("Forgot Password?")
                        .foregroundColor(.blue)
                        .padding(.top, 10)
                }
                
                Button(action: {
                    // Perform login action here
                    print("Login button tapped")
                }) {
                    Text("Login")
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(.blue)
                        .cornerRadius(8)
                        .padding(.horizontal, 20)
                }
                .disabled(isLoginEnabled)
                .opacity(isLoginEnabled ? 1 : 0.5)
                
                Spacer()
                
                HStack {
                    Text("Don't have an account?")
                    NavigationLink(destination: Text("Sign Up")) {
                        Text("Sign Up")
                            .foregroundColor(.blue)
                    }
                }
                .padding(.bottom, 20)
            }
            .navigationBarTitle("Login", displayMode: .inline)
        }
    }
    
    private func updateLoginButtonState() {
        // Validate username with a simple regex for demonstration purposes
        let usernameRegex = #"^[a-zA-Z0-9_-]{3,16}$"#
        let isValidUsername = NSPredicate(format: "SELF MATCHES %@", usernameRegex).evaluate(with: username)
        
        // Validate password with a simple regex for demonstration purposes
        let passwordRegex = #"^(?=.*[A-Za-z])[A-Za-z\d]{3,16}$"#
        let isValidPassword = NSPredicate(format: "SELF MATCHES %@", passwordRegex).evaluate(with: password)
        
        isLoginEnabled = isValidUsername && isValidPassword
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
