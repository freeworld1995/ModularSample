import SwiftData

@Model
public class Drink: Codable {
    public let name: String
    public let color: String
    
    public init(name: String, color: String) {
        self.name = name
        self.color = color
    }
    
    // MARK: Codable
    
    enum CodingKeys: CodingKey {
        case name
        case color
    }
    
    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        name = try container.decode(String.self, forKey: .name)
        color = try container.decode(String.self, forKey: .color)
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(name, forKey: .name)
        try container.encode(color, forKey: .color)
    }
}
