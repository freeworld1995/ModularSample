import SwiftData

@Model
public final class Drink {
    public let name: String
    public let color: String
    public let description: String
    
    public init(name: String) {
        self.name = name
    }
}
