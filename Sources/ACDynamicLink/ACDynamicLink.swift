import Firebase

public struct ACDynamicLink {
    
    private(set) var generator: Generator
    private(set) var reader: Reader
    
    public init(data: GenerationData) {
        self.generator = FBGenerator(data: data)
        self.reader = FBReader()
    }
}
