//
//  WorkspacesView.swift
//  vican
//
//  Created by m00nbek on 12/17/23.
//

import SwiftUI

struct WorkspacesView: View {
    var workspaces: [Workspace]
    
    @State var searchText: String = ""
    
    var searchResults: [Workspace] {
        return searchText.isEmpty ? workspaces : workspaces.filter { $0.name.contains(searchText)
        }
    }

    var body: some View {
        NavigationView {
            VStack {
                List(searchResults) { workspace in
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
            .navigationTitle("Workspaces")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                // Profile
                ToolbarItem(placement: .topBarLeading) {
                    NavigationLink(destination: EmptyView()) {
                        Image(systemName: "person.circle.fill")
                            .imageScale(.large)
                            .font(.title)
                            .foregroundStyle(.foreground)
                    }
                    .padding()
                }
                
                // WorkspacesOnMap
                ToolbarItem(placement: .topBarTrailing) {
                    NavigationLink(destination: EmptyView()) {
                        Image(systemName: "map.circle.fill")
                            .imageScale(.large)
                            .font(.title)
                            .foregroundStyle(.foreground)
                    }
                    .padding()
                }
            }
        }
        .searchable(text: $searchText)
    }
}

struct WorkspacesView_Previews: PreviewProvider {
    static var previews: some View {
        WorkspacesView(workspaces: Workspace.sample)
    }
}
