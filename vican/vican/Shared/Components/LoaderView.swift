//
//  LoaderView.swift
//  vican
//
//  Created by m00nbek on 12/16/23.
//

import SwiftUI

struct LoaderView: View {
    @Binding var isLoading: Bool
    
    var body: some View {
        if isLoading {
            Color.black.opacity(0.5)
                .edgesIgnoringSafeArea(.all)
            
            ProgressView("Sending verification code...")
                .progressViewStyle(CircularProgressViewStyle(tint: .white))
                .foregroundStyle(.white)
        }
    }
}
