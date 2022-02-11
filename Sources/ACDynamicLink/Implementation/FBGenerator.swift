//
//  DynamicLinkService.swift
//  Trade Union
//
//  Created by  Кирилл on 2/19/19.
//  Copyright © 2019 AppCraft. All rights reserved.
//

import Foundation
import Firebase

struct FBGenerator: Generator {
    
    private(set) var data: GenerationDataProvider
    
    func generate(path: NavigatablePath, isShort: Bool = true, completion: @escaping (URL?) -> Void) {
        guard let link = url(for: path) else { return }
        let linkBuilder = DynamicLinkComponents(link: link, domainURIPrefix: data.domainURLPrefix)
        linkBuilder?.iOSParameters = DynamicLinkIOSParameters(bundleID: data.iOSBundle)
        linkBuilder?.iOSParameters?.appStoreID = data.appStoreID
        if let androidBundle = data.androidBundle {
            linkBuilder?.androidParameters = DynamicLinkAndroidParameters(packageName: androidBundle)
        }

        if isShort {
            linkBuilder?.shorten(completion: { (url, _, _) in
                completion(url)
            })
        } else {
            completion(linkBuilder?.url)
        }
    }
}

// MARK: - Supporting methods
private extension FBGenerator {
    
    func url(for path: NavigatablePath) -> URL? {
        let pathString = data.urlString + path.path
        guard let id = path.id else {
            return URL(string: pathString)
        }
       return URL(string: pathString + "id=" + id)
    }
}
