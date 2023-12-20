//
//  WorkspacesView.swift
//  vican
//
//  Created by m00nbek on 12/17/23.
//

import SwiftUI

struct WorkspacesView: View {
    var workspaces: [Workspace]

    var body: some View {
        NavigationView {
            List(workspaces) { workspace in
                ZStack {
                    WorkspaceRow(workspace: workspace)
                        .shadow(radius: 12)
                    NavigationLink(destination: WorkspaceDetailView(workspace: workspace)) {
                        EmptyView()
                    }.opacity(0)
                }
                .listRowSeparator(.hidden)
                .listRowBackground(Color.white)
            }
            .listStyle(.plain)
        }
    }
}

struct WorkspacesView_Previews: PreviewProvider {
    static var previews: some View {
        WorkspacesView(workspaces: Workspace.sample)
    }
}
