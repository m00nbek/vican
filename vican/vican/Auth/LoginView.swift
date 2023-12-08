//
//  LoginView.swift
//  vican
//
//  Created by m00nbek on 12/8/23.
//

import SwiftUI

struct LoginView: View {
    @State private var showHome: Bool = false
    @State private var phoneNumber: String = "+998"
    @State private var isSubmitEnabled = false
    
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
                
                TextField("Phone Number", text: $phoneNumber)
                    .padding()
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(8)
                    .padding(.horizontal, 20)
                    .autocapitalization(.none)
                    .disableAutocorrection(true)
                    .keyboardType(.phonePad)
                    .onChange(of: phoneNumber) {
                        phoneNumber = phoneNumber.formatPhoneNumber()
                        validateSubmitButton()
                    }
                
                .navigationDestination(isPresented: $showHome) {
                    HomeView()
                }
                
                Button(action: {
                    saveToken()
                    showHome = true
                }) {
                    Text("Submit")
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(.blue)
                        .cornerRadius(8)
                        .padding(.horizontal, 20)
                }
                .disabled(!isSubmitEnabled)
                .opacity(isSubmitEnabled ? 1 : 0.5)
                
                Spacer()
                Spacer()
            }
            .navigationBarTitle("Login", displayMode: .inline)
        }
    }
    
    private func validateSubmitButton() {
        let phoneRegex = #"^\+\d{3} \(\d{2}\) \d{3}-\d{4}$"#
        let isValidPhone = NSPredicate(format: "SELF MATCHES %@", phoneRegex).evaluate(with: phoneNumber)
        
        isSubmitEnabled = isValidPhone
    }
    
    private func saveToken() {
//        AuthManager.shared.token = "token"
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
