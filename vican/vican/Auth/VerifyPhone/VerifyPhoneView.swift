//
//  VerifyPhoneView.swift
//  vican
//
//  Created by m00nbek on 12/9/23.
//

import SwiftUI

struct VerifyPhoneView: View {
    @EnvironmentObject private var appRootManager: AppRootManager
    @StateObject private var viewModel: ViewModel
    
    // pin
    @FocusState private var pinFocusState: Int?
    
    init(viewModel: ViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
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
                
                HStack(spacing: 15) {
                    ForEach(viewModel.pins.indices, id: \.self) { index in
                        TextField("", text: $viewModel.pins[index])
                            .multilineTextAlignment(.center)
                            .frame(width: 40, height: 40)
                            .background(Color.gray.opacity(0.1))
                            .cornerRadius(8)
                            .keyboardType(.numberPad)
                            .onChange(of: viewModel.pins[index]) {
                                if viewModel.pins[index].count > 1 {
                                    viewModel.pins[index] = String(viewModel.pins[index].prefix(1))
                                }
                                
                                handlePinChange(index: index, newValue: viewModel.pins[index])
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
        .onChange(of: viewModel.isLoading) { _, newValue in
            if newValue {
                pinFocusState = nil
            }
        }
        .onChange(of: viewModel.presentHome) { _, newValue in
            if newValue {
                withAnimation(.easeInOut(duration: 1)) {
                    appRootManager.currentRoot = .home
                }
            }
        }
    }
    
    // MARK: - Helpers
    private func handlePinChange(index: Int, newValue: String) {
        if newValue.count == 1 {
            pinFocusState = index.nextIndex
        } else if newValue.isEmpty {
            pinFocusState = index.prevIndex
        }
        
        if index == viewModel.pins.indices.last && viewModel.isVerificationEnabled {
            pinFocusState = nil
            viewModel.verifyPhoneNumber()
        }
    }
}
