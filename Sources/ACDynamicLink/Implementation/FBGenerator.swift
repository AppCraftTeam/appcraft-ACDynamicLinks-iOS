//
//  FBGenerator.swift
//
//
//  Created by Анатолий Руденко on 13.01.2022.
//

import Foundation
import Firebase

struct FBGenerator: Generator {
    
    public init(data: GenerationDataProvider) {
        self.data = data
    }
    
    private var data: GenerationDataProvider
    
    func generate(path: NavigatablePath, completion: @escaping (URL?) -> Void) {
        guard let link = url(for: path) else { return }
        let linkBuilder = DynamicLinkComponents(link: link, domainURIPrefix: data.domainURLPrefix)
        linkBuilder?.iOSParameters = DynamicLinkIOSParameters(bundleID: data.iOSBundle)
        linkBuilder?.iOSParameters?.appStoreID = data.appStoreID
        if let androidBundle = data.androidBundle {
            linkBuilder?.androidParameters = DynamicLinkAndroidParameters(packageName: androidBundle)
        }
        linkBuilder?.shorten(completion: { (url, _, _) in
            completion(url)
        })
    }
}

// MARK: - Supporting methods
private extension FBGenerator {
    
    func url(for path: NavigatablePath) -> URL? {
        let pathString = data.urlStringPrefix + path.pathSuffix
        guard let id = path.id else {
            return URL(string: pathString)
        }
       return URL(string: pathString + "id=" + id)
    }
}
