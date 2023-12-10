//
//  AppRootManager.swift
//  vican
//
//  Created by m00nbek on 12/10/23.
//

import Foundation

final class AppRootManager: ObservableObject {
    
    @Published var currentRoot: eAppRoots = .splash
    
    enum eAppRoots {
        case splash
        case auth
        case home
    }
}
