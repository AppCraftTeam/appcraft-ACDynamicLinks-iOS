//
//  NavigationPath.swift
//  
//
//  Created by Анатолий Руденко on 02.02.2022.
//

import Foundation

public struct NavigationPath: NavigatablePath {
    
    public var path: String
    public var pathPreffix: String
    public var pathSuffix: String
    public var id: String?
}

public extension NavigationPath {
    
    init(pathPreffix: String, pathSuffix: String, id: String) {
        self.pathPreffix = pathPreffix
        self.pathSuffix = pathSuffix
        self.path = pathPreffix + pathSuffix
        self.id = id
    }
}

extension NavigationPath {
    
    init(urlString: String, pathPreffix: String) {
        let components = urlString.components(separatedBy: "id=")
        if let id = components.last {
            self.id = id
        }
        self.path = components.first ?? urlString
        self.pathPreffix = pathPreffix
        self.pathSuffix = path.components(separatedBy: pathPreffix).last ?? ""
    }
}
