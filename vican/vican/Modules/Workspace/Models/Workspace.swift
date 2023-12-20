//
//  Workspace.swift
//  vican
//
//  Created by m00nbek on 12/17/23.
//

import SwiftUI

struct Workspace: Identifiable {
    var id = UUID()
    var name: String
    var description: String
    var image: Image
}

extension Workspace {
    static var sample: [Workspace] {
        [
            Workspace(name: "Workspace 1", description: "Description for Workspace 1", image: Image(.workspace1)),
            Workspace(name: "Workspace 2", description: "Description for Workspace 2", image: Image(.workspace2)),
            Workspace(name: "Workspace 3", description: "Description for Workspace 3", image: Image(systemName: "building.2"))
        ]
    }
}

