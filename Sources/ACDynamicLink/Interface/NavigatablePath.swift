//
//  Navigatable.swift
//  
//
//  Created by Анатолий Руденко on 02.02.2022.
//

import Foundation

public protocol NavigatablePath {
    var path: String { get }
    var pathPreffix: String { get }
    var pathSuffix: String { get }
    var id: String? { get }
}

