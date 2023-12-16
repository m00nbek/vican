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
                NavigationLink(destination: WorkspaceDetailView(workspace: workspace)) {
                    WorkspaceRow(workspace: workspace)
                }
            }
            .navigationBarTitle("Workspaces")
        }
    }
}

struct WorkspacesView_Previews: PreviewProvider {
    static var previews: some View {
        WorkspacesView(workspaces: Workspace.sample)
    }
}
