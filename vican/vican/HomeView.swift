//
//  HomeView.swift
//  vican
//
//  Created by m00nbek on 12/7/23.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
            
            NavigationLink(destination: Text("Forgot Password?")) {
                Text("Forgot Password?")
                    .foregroundColor(.blue)
                    .padding(.top, 10)
            }
            
            Button {
                AuthManager.shared.token = nil
            } label: {
                Text("clear token")
            }

        }
        .padding()
    }
}

#Preview {
    HomeView()
}
