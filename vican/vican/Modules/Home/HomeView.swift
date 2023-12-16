//
//  HomeView.swift
//  vican
//
//  Created by m00nbek on 12/7/23.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        TabView {
            WorkspaceFlow().start()
                .tabItem {
                    Label("Workspaces", systemImage: "list.dash")
                }
        }
    }
}
