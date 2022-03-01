//
//  GenerationData.swift
//  
//
//  Created by Анатолий Руденко on 02.02.2022.
//

import Foundation

public protocol GenerationDataProvider {
    var urlStringPrefix: String { get }
    var domainURLPrefix: String { get }
    var iOSBundle: String { get }
    
    // optionals
    var appStoreID: String? { get }
    var androidBundle: String? { get }
}

public struct GenerationData: GenerationDataProvider {
    
    public let urlStringPrefix: String
    public let domainURLPrefix: String
    public let iOSBundle: String
    public let appStoreID: String?
    public let androidBundle: String?
    
    public init(urlStringPrefix: String, domainURLPrefix: String, iOSBundle: String, appStoreID: String?, androidBundle: String?) {
        self.urlStringPrefix = urlStringPrefix
        self.domainURLPrefix = domainURLPrefix
        self.iOSBundle = iOSBundle
        self.appStoreID = appStoreID
        self.androidBundle = androidBundle
    }
}
