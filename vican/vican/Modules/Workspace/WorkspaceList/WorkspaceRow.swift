//
//  WorkspaceRow.swift
//  vican
//
//  Created by m00nbek on 12/17/23.
//

import SwiftUI

struct WorkspaceRow: View {
    var workspace: Workspace

    var body: some View {
        HStack {
            workspace.image
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 50, height: 50)
                .cornerRadius(8)

            VStack(alignment: .leading) {
                Text(workspace.name)
                    .font(.headline)
                Text(workspace.description)
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
        }
        .padding(8)
    }
}
