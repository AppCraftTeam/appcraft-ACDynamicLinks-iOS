//
//  GenerationData.swift
//  
//
//  Created by Анатолий Руденко on 02.02.2022.
//

import Foundation

public protocol GenerationData {
    var urlString: String { get }
    var domainURIPrefix: String { get }
    var iOSBundle: String { get }
    
    // optionals
    var appStoreID: String? { get }
    var androidBundle: String? { get }
}
