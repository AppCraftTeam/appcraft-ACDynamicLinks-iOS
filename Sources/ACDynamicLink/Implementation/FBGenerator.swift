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
    
    var data: GenerationData
    
    func generate(path: Navigatable, isShort: Bool = true, completion: @escaping (URL?) -> Void) {
        guard let link = url(for: path) else { return }
        let linkBuilder = DynamicLinkComponents(link: link, domainURIPrefix: data.domainURIPrefix)
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
    
    func url(for path: Navigatable) -> URL? {
        URL(string: data.urlString + path.path + (path.id ?? ""))
    }
}
