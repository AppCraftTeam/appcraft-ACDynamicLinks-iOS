//
//  Generator.swift
//  
//
//  Created by Анатолий Руденко on 02.02.2022.
//

import Foundation

public protocol Generator {
    
    var data: GenerationData { get }
    
    func generate(path: Navigatable, isShort: Bool, completion: @escaping (URL?) -> Void)
}
