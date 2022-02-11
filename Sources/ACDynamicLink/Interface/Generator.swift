//
//  Generator.swift
//  
//
//  Created by Анатолий Руденко on 02.02.2022.
//

import Foundation

public protocol Generator {
    
    func generate(path: NavigatablePath, isShort: Bool, completion: @escaping (URL?) -> Void)
}
