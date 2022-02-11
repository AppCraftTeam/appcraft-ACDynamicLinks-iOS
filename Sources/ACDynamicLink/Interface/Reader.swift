//
//  Reader.swift
//  
//
//  Created by Анатолий Руденко on 02.02.2022.
//

import Foundation

public protocol Reader {
    func getPath(from url: URL) -> NavigatablePath?
}
