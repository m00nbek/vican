//
//  WorkspaceDetail.swift
//  vican
//
//  Created by m00nbek on 12/17/23.
//

import SwiftUI

struct WorkspaceDetailView: View {
    @Environment(\.presentationMode) var presentationMode
    var workspace: Workspace

    var body: some View {
        ScrollView {
            // Horizontally scrollable images
            PageView(pages: workspace.images.map { image in
                image
                    .resizable()
                    .scaledToFill()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .clipped()
            })
            .frame(height: 300)
            
            // Details section
            VStack(alignment: .leading, spacing: 16) {
                Text(workspace.name)
                    .font(.title)
                    .fontWeight(.bold)
                
                Text(workspace.description)
                    .font(.body)
                    .foregroundColor(.gray)
                
                Text("About:")
                    .font(.headline)
                    .fontWeight(.bold)
                
                Text(workspace.about)
                    .font(.body)
                
                Text("Availability:")
                    .font(.headline)
                    .fontWeight(.bold)
                
                Text(workspace.availability)
                    .font(.body)
                
                Text("Location:")
                    .font(.headline)
                    .fontWeight(.bold)
                
                Text(workspace.location)
                    .font(.body)
                
                Spacer()
                
                // Book button
                Button(action: {
                    // Handle booking action
                }) {
                    Text("Book")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(Color.blue)
                        .cornerRadius(10)
                }
            }
            .padding()
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: Button(action: { presentationMode.wrappedValue.dismiss() }) {
            HStack {
                Image(systemName: "arrow.left.circle.fill")
                    .imageScale(.large)
                    .foregroundStyle(.white)
            }
            .padding()
        })
        .ignoresSafeArea()
    }
}

struct WorkspaceDetail_Previews: PreviewProvider {
    static var previews: some View {
        WorkspaceDetailView(workspace: Workspace.sample[0])
    }
}
