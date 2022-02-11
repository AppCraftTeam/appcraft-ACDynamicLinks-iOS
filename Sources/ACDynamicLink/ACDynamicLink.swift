import Firebase

public struct ACDynamicLink {
    
    private(set) public var generator: Generator
    private(set) public var reader: Reader
    
    public var paths = [NavigatablePath]()
    
    public init(generationData: GenerationDataProvider, paths: [NavigatablePath]) {
        self.generator = FBGenerator(data: generationData)
        self.reader = FBReader()
        self.paths = paths
    }
}
