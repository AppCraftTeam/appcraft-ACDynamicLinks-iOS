//
//  AppNavPath.swift
//  Dynamic Link Example
//
//  Created by Анатолий Руденко on 11.02.2022.
//

import UIKit
import ACDynamicLink

/// 1. Create your own PathType enum, something like:
enum PathType: String {
    case mainScreen
    case settingsScreen
    case unknown
}

/// 2. Ethier create an instance of a custom object conforming to GenerationDataProvider protocol, or simply create an instance of GenerationData:
let generationData = GenerationData(urlStringPrefix: "https://www.mywebsite.com/", // fallback URL
                                    domainURLPrefix: "https://myapp.page.link", // from firebase console
                                    iOSBundle: Bundle.main.bundleIdentifier ?? "com.myiosapp.isnice",
                                    appStoreID: "1337133713", // might not work without it
                                    androidBundle: "com.myandroidapp.isnice") // to provide cross-platform compatibility

/// 3. Initialize ACDynamicLink  in AppDleegate's didFinishLaunchingWithOptions and store its reference:
///* dynamicLink = ACDynamicLink(generationData: generationData)

/// 4. Implement AppDelegate's methods to open dynamic links
/// func application(_ application: UIApplication, open url: URL, sourceApplication: String?, annotation: Any) -> Bool
/// and
/// func application(_ application: UIApplication, continue userActivity: NSUserActivity, restorationHandler: @escaping ([UIUserActivityRestoring]?) -> Void) -> Bool
/// just like that:

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

/// 5. To create a link: call dynamicLink.generate(pathSuffix: String, id: String?, completion: @escaping (URL?) -> Void).
/// Example can be found in ViewController.swift
