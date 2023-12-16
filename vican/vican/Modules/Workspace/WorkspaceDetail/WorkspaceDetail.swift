//
//  WorkspaceDetail.swift
//  vican
//
//  Created by m00nbek on 12/17/23.
//

import SwiftUI

struct WorkspaceDetailView: View {
    var workspace: Workspace

    var body: some View {
        VStack {
            Image(workspace.imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .cornerRadius(8)
                .padding()

            Text(workspace.description)
                .font(.body)
                .padding()
            
            Spacer()
        }
        .navigationBarTitle(workspace.name)
    }
}
