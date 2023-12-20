//
//  LabelWithSpacingStyle.swift
//  vican
//
//  Created by m00nbek on 12/21/23.
//

import SwiftUI

struct LabelWithSpacingStyle: LabelStyle {
    var spacing: Double = 0.0
    
    func makeBody(configuration: Configuration) -> some View {
        HStack(spacing: spacing) {
            configuration.icon
            configuration.title
        }
    }
}
