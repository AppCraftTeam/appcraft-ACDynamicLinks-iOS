import Firebase

public struct ACDynamicLink {
    
    private(set) var generator: Generator
    private(set) var reader: Reader
    
    var paths = [NavigatablePath]()
    
    public init(generationData: GenerationDataProvider, paths: [NavigatablePath]) {
        self.generator = FBGenerator(data: generationData)
        self.reader = FBReader()
        self.paths = paths
    }
}

// MARK: - How to use:

/// 1. Create your own AppNavPath enum, something like:
//enum AppNavPath: String, CaseIterable {
//    case news
//    case settings
//
//    static var navPaths: [NavigatablePath] {
//        AppNavPath.allCases.map { NavigationPath(urlString: $0.rawValue) }
//    }
//}
//
///// 2. Ethier create an instance of a custom object conforming to GenerationDataProvider protocol, or simply create an instance of GenerationData:
//let generationData = GenerationData(urlString: "https://www.mywebsite.com/",
//                                    domainURIPrefix: "https://mywebsite.page.link",
//                                    iOSBundle: Bundle.main.bundleIdentifier ?? "com.myiosapp.isnice",
//                                    appStoreID: "1337133713", // might not work without it
//                                    androidBundle: "com.myandroidapp.isnice") // to provide cross-platform compatibility
//
///// 3. Initialize ACDynamicLink in AppDleegate's didFinishLaunchingWithOptions:
//let dynamicLink = ACDynamicLink(generationData: generationData, paths: AppNavPath.navPaths)
//
///// 4. Implement AppDelegate's methods
///// func application(_ application: UIApplication, open url: URL, sourceApplication: String?, annotation: Any) -> Bool
///// and
///// func application(_ application: UIApplication, continue userActivity: NSUserActivity, restorationHandler: @escaping ([UIUserActivityRestoring]?) -> Void) -> Bool
///// just like that:
//
//func application(_ application: UIApplication, open url: URL, sourceApplication: String?, annotation: Any) -> Bool {
//
//}
//
//func application(_ application: UIApplication, continue userActivity: NSUserActivity, restorationHandler: @escaping ([UIUserActivityRestoring]?) -> Void) -> Bool {
//
//}
