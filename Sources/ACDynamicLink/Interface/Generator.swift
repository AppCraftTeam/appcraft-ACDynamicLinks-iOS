//
//  Generator.swift
//  
//
//  Created by Анатолий Руденко on 02.02.2022.
//

import Foundation

public protocol Generator {
    
    var data: GenerationData { get }
    
    func generate(path: NavigatablePath, isShort: Bool, completion: @escaping (URL?) -> Void)
}
