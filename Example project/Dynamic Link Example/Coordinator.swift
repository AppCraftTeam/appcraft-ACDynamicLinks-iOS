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
        let appNavPath = AppPath(navigatablePath: navPath)
        let id = navPath?.id
        
        guard appNavPath != .unknown else { return }
        switch appNavPath {
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

extension AppPath {
    
    init(navigatablePath: NavigatablePath?) {
        self = .init(rawValue: navigatablePath?.path ?? "") ?? .unknown
    }
}