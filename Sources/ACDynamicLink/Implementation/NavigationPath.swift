//
//  NavigationPath.swift
//  
//
//  Created by Анатолий Руденко on 02.02.2022.
//

import Foundation

struct NavigationPath: NavigatablePath {
    
    public var path: String
    public var id: String?
}

extension NavigationPath {
    
    init(urlString: String) {
        let components = urlString.components(separatedBy: "id=")
        if let id = components.last {
            self.id = id
        }
        self.path = components.first ?? urlString
    }
}
