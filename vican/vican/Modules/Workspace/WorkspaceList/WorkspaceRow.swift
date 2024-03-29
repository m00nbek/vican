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
        VStack(alignment: .leading, spacing: 8) {
            workspace.image
                .resizable()
                .aspectRatio(contentMode: .fit)
                .cornerRadius(8)

            Text(workspace.name)
                .font(.headline)
                .multilineTextAlignment(.leading)
            
            HStack(alignment: .firstTextBaseline, spacing: 12) {
                Label("Neive", systemImage: "mappin.and.ellipse.circle")
                    .font(.caption)
                    .foregroundStyle(.green)
                    .padding(.zero)
                    .lineLimit(1)
                    .labelStyle(LabelWithSpacingStyle(spacing: 4))
                Label("8 Desks", systemImage: "square.stack.3d.up")
                    .font(.caption)
                    .foregroundStyle(.green)
                    .padding(.zero)
                    .lineLimit(1)
                    .labelStyle(LabelWithSpacingStyle(spacing: 4))
                Label("0 Rooms", systemImage: "door.left.hand.open")
                    .font(.caption)
                    .foregroundStyle(.green)
                    .padding(.zero)
                    .lineLimit(1)
                    .labelStyle(LabelWithSpacingStyle(spacing: 4))
                Spacer()
            }
        }
        .padding(8)
    }
}

struct WorkspaceRow_Previews: PreviewProvider {
    static var previews: some View {
        WorkspaceRow(workspace: Workspace.sample[0])
            .previewLayout(.sizeThatFits)
    }
}
