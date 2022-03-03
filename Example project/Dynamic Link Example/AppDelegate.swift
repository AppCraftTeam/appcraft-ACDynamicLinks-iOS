//
//  AppDelegate.swift
//  Dynamic Link Example
//
//  Created by Анатолий Руденко on 11.02.2022.
//

import UIKit
import ACDynamicLink

var dynamicLink: ACDynamicLink!

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let generationData = GenerationData(urlStringPrefix: "https://www.mywebsite.com/", // fallback URL
                                            domainURLPrefix: "https://myapp.page.link", // from firebase console
                                            iOSBundle: Bundle.main.bundleIdentifier ?? "com.myiosapp.isnice",
                                            appStoreID: "1337133713", // might not work without it
                                            androidBundle: "com.myandroidapp.isnice") // to provide cross-platform compatibility
        
        dynamicLink = ACDynamicLink(generationData: generationData)
        return true
    }

    func application(_ application: UIApplication, open url: URL, sourceApplication: String?, annotation: Any) -> Bool {
        let canOpenURL = dynamicLink.readFromURL(url) { path in
            Coordinator.handleNavPath(path)
        }
        return canOpenURL
    }

    func application(_ application: UIApplication, continue userActivity: NSUserActivity, restorationHandler: @escaping ([UIUserActivityRestoring]?) -> Void) -> Bool {
        let canOpenURL = dynamicLink.readFromUserActivity(userActivity) { path in
            Coordinator.handleNavPath(path)
        }
        return canOpenURL
    }
}

