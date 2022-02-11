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
