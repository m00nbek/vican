//
//  VerifyCodeInputView.swift
//  vican
//
//  Created by m00nbek on 12/15/23.
//

import SwiftUI

struct VerifyCodeInputView: View {
    @Binding var inputCode: String
    @Binding var digits: [String]
    @FocusState var keyboardFocus: Bool
    
    private var digitLabels: [DigitLabel] {
        digits.map { DigitLabel(digit: $0) }
    }
    
    var body: some View {
        HStack(spacing: 15) {
            ForEach(digitLabels.indices, id: \.self) { index in
                digitLabels[index]
            }
            
            TextField("", text: $inputCode)
                .frame(width: 0, height: 0)
                .keyboardType(.numberPad)
                .focused($keyboardFocus)
        }
        .frame(height: 40)
        .padding(.vertical)
        .onAppear {
            keyboardFocus = true
            updateDigitLabels()
        }
        .onChange(of: inputCode) { _ in
            updateDigitLabels()
        }
    }
    
    private func updateDigitLabels() {
        inputCode = String(digits.joined())
    }
    
    private struct DigitLabel: View {
        var digit: String
        
        var body: some View {
            Text(digit)
                .font(.title2)
                .frame(width: 40, height: 40)
                .background(Color.gray.opacity(0.1))
                .cornerRadius(8)
                .multilineTextAlignment(.center)
        }
    }
}
