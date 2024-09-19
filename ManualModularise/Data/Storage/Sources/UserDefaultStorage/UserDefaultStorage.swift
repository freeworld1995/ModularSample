import SwiftData
import Entities
import StorageAPI
import Foundation

public class UserDefaultStorage<Model: Codable & Identifiable>: @preconcurrency StorageAPI {
    private let userDefault: UserDefaults
    
    required public init(userDefault: UserDefaults = .standard) {
        self.userDefault = userDefault
    }
    
    @MainActor public func get() -> [Model] {
        guard let data: Data = userDefault.data(forKey: "menu") else {
            return []
        }
        
        guard let items = try? JSONDecoder().decode([Model].self, from: data) else {
            return []
        }
        
        return items
    }
    
    @MainActor public func insert(_ model: Model) {
        guard let data = try? JSONSerialization.data(withJSONObject: model) else {
            return
        }
        userDefault.setValue(data, forKey: "\(model.id)")
    }
    
    @MainActor public func delete(_ model: Model) {
        userDefault.setValue(nil, forKey: "\(model)")
    }
}
