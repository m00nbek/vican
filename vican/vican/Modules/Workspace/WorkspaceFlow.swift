//
//  WorkspaceFlow.swift
//  vican
//
//  Created by m00nbek on 12/17/23.
//

import SwiftUI

struct WorkspaceFlow {
    
    @MainActor
    func start() -> some View {
        WorkspacesView(workspaces: Workspace.sample)
    }
}
