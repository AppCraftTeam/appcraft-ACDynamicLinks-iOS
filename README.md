# ACDynamicLink

Handy dynamic links manager based of Firebase Dynamic Links.

[![version](https://img.shields.io/badge/version-0.0.1-white.svg)](https://semver.org)

## Requirements
* IOS 11 or above
* Xcode 12.5 or above

## Installation

1. Go to `File` -> `Swift Packages` -> `Add Package Dependency...`
2. Then search for 
```
https://github.com/AppCraftTeam/appcraft-ACDynamicLinks-iOS.git
```
3. Select the SDK version that you want to use

## How to use

1. Create your own PathType enum, something like:
```swift
enum PathType: String {
    case mainScreen
    case settingsScreen
    case unknown
}
```

2. Create an instance of GenerationData: GenerationDataProvider
```swift
let generationData = GenerationData(urlStringPrefix: "https://www.mywebsite.com/", // fallback URL
                                    domainURLPrefix: "https://myapp.page.link", // from firebase console
                                    iOSBundle: Bundle.main.bundleIdentifier ?? "com.myiosapp.isnice",
                                    appStoreID: "1337133713", // might not work without it
                                    androidBundle: "com.myandroidapp.isnice") // to provide cross-platform compatibility
```

3. Initialize ACDynamicLink  in AppDleegate's didFinishLaunchingWithOptions and store its reference:
```swift
dynamicLink = ACDynamicLink(generationData: generationData)
```

4. Implement AppDelegate's methods to receive and handle dynamic links
```swift
func application(_ application: UIApplication, open url: URL, sourceApplication: String?, annotation: Any) -> Bool {
    let canOpenURL = dynamicLink.readFromURL(url) { path in
        // handle nav path
    }
    return canOpenURL
}

func application(_ application: UIApplication, continue userActivity: NSUserActivity, restorationHandler: @escaping ([UIUserActivityRestoring]?) -> Void) -> Bool {
    let canOpenURL = dynamicLink.readFromUserActivity(userActivity) { path in
        // handle nav path
    }
    return canOpenURL
}
```
Example of handling nav path:
```swift
func handleNavPath(_ navPath: NavigatablePath?) {
    guard let navPath = navPath else { return }
    let appNavPath = AppNavPath(navigatablePath: navPath)
    
    guard appNavPath.type != .unknown else { return }
    switch appNavPath.type {
    case .mainScreen:
        // push/present whatever you need
        break
    case .settingsScreen:
        // push/present whatever you need
        break
    case .unknown:
        // push/present whatever you need
        break
    }
}

struct AppNavPath {
    let type: PathType
    let id: String?
    
    init(navigatablePath: NavigatablePath) {
        self.type = PathType(rawValue: navigatablePath.pathSuffix) ?? .unknown
        self.id = navigatablePath.id
    }
}
```

6. To create a link:
```swift
dynamicLink.generate(pathSuffix: String, id: String?, completion: @escaping (URL?) -> Void)
```

Example of creating a link
```swift
func generateLink(path: AppNavPath) {
    dynamicLink.generate(pathSuffix: path.type.rawValue, id: path.id) { [weak self] url in
        
        // example of sharing a link
        guard let url = url else { return }
        let vc = UIActivityViewController(activityItems: [url.absoluteString], applicationActivities: nil)
        vc.popoverPresentationController?.sourceView = self?.view
        vc.modalPresentationStyle = .fullScreen
        self?.present(vc, animated: true)
    }
}
```

There is an [Example project](/Example project) to help you figure it all out.

## Warning
Do not forget to set up [Firebase Console](https://console.firebase.google.com/) and add GoogleService-Info.plist to your project

If your project already has Firebase framework installed, you will face crashes as ACDynamicLink already contains that dependency. 
Remove the original dependency to avoid crashes.

## License
Distributed under the MIT License.

## Author
Email: <rudenkoswift@gmail.com>
