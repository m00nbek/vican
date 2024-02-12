//
//  HomeView.swift
//  vican
//
//  Created by m00nbek on 12/7/23.
//

import SwiftUI

struct HomeView: View {
    @State private var selection: Int? = nil
    
    var body: some View {
        TabView(selection: $selection) {
            WorkspaceFlow()
                .start()
//                .onTapGesture {
//                    // Reset the selection to nil when the tab is tapped again
//                    if selection == 1 {
//                        selection = nil
//                    }t lo
//                }
                .tabItem {
                    Label("Workspaces", systemImage: "building.2")
                }
                .tag(1)
        }
    }
}
