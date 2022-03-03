//
//  Generator.swift
//  
//
//  Created by Анатолий Руденко on 02.02.2022.
//

import Foundation

public protocol Generator {
    
    func generate(pathSuffix: String, id: String?, completion: @escaping (URL?) -> Void)
}
