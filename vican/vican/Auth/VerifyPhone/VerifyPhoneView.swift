//
//  VerifyPhoneView.swift
//  vican
//
//  Created by m00nbek on 12/9/23.
//

import SwiftUI
import Combine

struct VerifyPhoneView: View {
    @StateObject private var viewModel = ViewModel()
    // pin
    @FocusState private var pinFocusState: Int?
    @State private var pins: [String] = Array(repeating: "", count: 6)

    var body: some View {
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

            HStack(spacing: 15) {
                ForEach(pins.indices, id: \.self) { index in
                    TextField("", text: $pins[index])
                        .multilineTextAlignment(.center)
                        .frame(width: 40, height: 40)
                        .background(Color.gray.opacity(0.1))
                        .cornerRadius(8)
                        .keyboardType(.numberPad)
                        .onChange(of: pins[index]) {
                            if pins[index].count > 1 {
                                pins[index] = String(pins[index].prefix(1))
                            }
                            
                            handlePinChange(index: index, newValue: pins[index])
                        }
                        .focused($pinFocusState, equals: index)
                }
            }
            .padding(.vertical)
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now()) {
                    pinFocusState = 0
                }
            }
            
            Button {
                // action
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
        }
    }
    
    // MARK: - Helpers
    private func handlePinChange(index: Int, newValue: String) {
        if newValue.count == 1 {
            pinFocusState = index.nextIndex
        } else if newValue.isEmpty {
            pinFocusState = index.prevIndex
        }
        
        if index == pins.indices.last {
            pinFocusState = nil
        }
    }
}
