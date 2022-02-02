//
//  FBReader.swift
//  Trade Union
//
//  Created by Анатолий Руденко on 13.01.2022.
//

import UIKit
import Firebase

struct FBReader: Reader {
    
    func getPath(from url: URL) -> NavigationPath? {
        guard let dynamicLinkURL = DynamicLinks.dynamicLinks().dynamicLink(fromCustomSchemeURL: url)?.url else { return nil }
        let urlString = dynamicLinkURL.absoluteString
        let navPath = NavigationPath(urlString: urlString)
        return navPath
    }
}

// MARK: - Supporting methods
private extension FBReader {
    
}
