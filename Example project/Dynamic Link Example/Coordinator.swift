//
//  Coordinator.swift
//  Dynamic Link Example
//
//  Created by Анатолий Руденко on 11.02.2022.
//

import Foundation
import ACDynamicLink

class Coordinator {
    
    static func handleNavPath(_ navPath: NavigatablePath?) {
        guard let navPath = navPath else { return }
        let appNavPath = AppNavPath(navigatablePath: navPath)
        
        guard appNavPath.type != .unknown else { return }
        switch appNavPath.type {
        case .mainScreen:
            // push/present whatever you need
            break
        case .settingsScreen:
            // push/present whatever you need
            break
        case .unknown:
            // push/present whatever you need
            break
        }
    }
}

struct AppNavPath {
    let type: PathType
    let id: String?
    
    init(navigatablePath: NavigatablePath) {
        self.type = PathType(rawValue: navigatablePath.pathSuffix) ?? .unknown
        self.id = navigatablePath.id
    }
}

enum PathType: String {
    case mainScreen
    case settingsScreen
    case unknown
}
