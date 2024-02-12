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
    var about: String
    var availability: String
    var location: String
    var description: String
    var image: Image
    var images: [Image]
}

extension Workspace {
    static var sample: [Workspace] {
        [
            Workspace(name: "Workspace uno", about: "Uhm Uh. Worskpace?", availability: "9-5 every fkin day", location: "somewhere on earth", description: "good.. comfortable place i guess", image: Image(.workspace1), images: [Image(.workspace1), Image(.workspace2), Image(.workspace1)]),
            Workspace(name: "Workspace dos", about: "Uhm Uh. Worskpace?", availability: "9-5 every fkin day", location: "somewhere on earth", description: "good.. comfortable place i guess", image: Image(.workspace2), images: [Image(.workspace1), Image(.workspace2), Image(.workspace1)]),
            Workspace(name: "Workspace tres", about: "Uhm Uh. Worskpace?", availability: "9-5 every fkin day", location: "somewhere on earth", description: "good.. comfortable place i guess", image: Image(.workspace1), images: [Image(.workspace1), Image(.workspace2), Image(.workspace1)]),
            Workspace(name: "Workspace quadro", about: "Uhm Uh. Worskpace?", availability: "9-5 every fkin day", location: "somewhere on earth", description: "good.. comfortable place i guess", image: Image(.workspace2), images: [Image(.workspace1), Image(.workspace2), Image(.workspace1)])
        ]
    }
}

