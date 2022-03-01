//
//  NavigationPath.swift
//  
//
//  Created by Анатолий Руденко on 02.02.2022.
//

import Foundation

public struct NavigationPath: NavigatablePath {
    
    public var path: String
    public var pathPrefix: String
    public var pathSuffix: String
    public var id: String?
}

public extension NavigationPath {
    
    init(pathPrefix: String, pathSuffix: String, id: String) {
        self.pathPrefix = pathPrefix
        self.pathSuffix = pathSuffix
        self.path = pathPrefix + pathSuffix
        self.id = id
    }
}

extension NavigationPath {
    
    init(urlString: String, pathPrefix: String) {
        let components = urlString.components(separatedBy: "id=")
        if let id = components.last {
            self.id = id
        }
        self.path = components.first ?? urlString
        self.pathPrefix = pathPrefix
        self.pathSuffix = path.components(separatedBy: pathPrefix).last ?? ""
    }
}
