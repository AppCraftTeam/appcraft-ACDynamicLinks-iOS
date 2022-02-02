//
//  DynamicLinkService.swift
//  Trade Union
//
//  Created by  Кирилл on 2/19/19.
//  Copyright © 2019 AppCraft. All rights reserved.
//

import Foundation
import Firebase

protocol Navigatable {
    var path: String { get }
    var id: String? { get }
}

class Generator: NSObject {
    
    var urlString = "https://www.tradeunion.com/"
    var domainURIPrefix = "https://tradeunion.page.link"
    
    var iOSBundle = "com.tradeunion.gaz"
    var androidBundle = "ru.tradeunion.privilege"
    
    var appStoreID = "1452471100"
    
    func generate(path: Navigatable, isShort: Bool, completion: @escaping (URL?) -> Void) {
        guard let link = url(for: path) else { return }
        let linkBuilder = DynamicLinkComponents(link: link, domainURIPrefix: domainURIPrefix)
        linkBuilder?.iOSParameters = DynamicLinkIOSParameters(bundleID: iOSBundle)
        linkBuilder?.iOSParameters?.appStoreID = appStoreID
        linkBuilder?.androidParameters = DynamicLinkAndroidParameters(packageName: androidBundle)

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
private extension Generator {
    
    func url(for path: Navigatable) -> URL? {
        URL(string: urlString + path.path + (path.id ?? ""))
    }
}
