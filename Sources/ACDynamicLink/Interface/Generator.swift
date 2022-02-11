//
//  Generator.swift
//  
//
//  Created by Анатолий Руденко on 02.02.2022.
//

import Foundation

public protocol Generator {
    
    var data: GenerationDataProvider { get }
    
    func generate(path: NavigatablePath, isShort: Bool, completion: @escaping (URL?) -> Void)
}
