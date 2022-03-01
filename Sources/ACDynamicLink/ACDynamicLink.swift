import Firebase

public struct ACDynamicLink: Generator, Reader {
    
    // MARK: - Methods
    public func generate(path: NavigatablePath, completion: @escaping (URL?) -> Void) {
        generator.generate(path: path, completion: completion)
    }
    
    public func readFromURL(_ url: URL, completion: (NavigatablePath?) -> Void) -> Bool {
        reader.readFromURL(url, completion: completion)
    }
    
    public func readFromUserActivity(_ activity: NSUserActivity, completion: @escaping PathCompletionHandler) -> Bool {
        reader.readFromUserActivity(activity, completion: completion)
    }
    
//    public func getPathExtension(for navigatablePath: NavigatablePath, among pathExtensions: [String]) -> String? {
//        let prefix = generationData.urlStringPrefix
//        guard let pathExtension = navigatablePath.pathSuffix.components(separatedBy: prefix).last,
//              let pathExtension = pathExtensions.first(where: { pathExtension == $0 })
//        else { return nil }
//        return pathExtension
//    }
    
    // MARK: - Init
    public init(generationData: GenerationDataProvider) {
        self.generator = FBGenerator(data: generationData)
        self.reader = FBReader(pathPreffix: generationData.urlStringPrefix)
        self.generationData = generationData
        if FirebaseApp.app() == nil {
            FirebaseApp.configure()
        }
        FirebaseOptions.defaultOptions()?.deepLinkURLScheme = generationData.iOSBundle
    }
    
    // MARK: - Private Props
    private var generator: Generator
    private var reader: Reader
    private var generationData: GenerationDataProvider
}
