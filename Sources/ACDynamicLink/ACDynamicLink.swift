 import Firebase

public struct ACDynamicLink {
    
    var generator: Generator
    
    public init(data: GenerationData) {
        self.generator = FBGenerator(data: data)
    }
    
    
}
