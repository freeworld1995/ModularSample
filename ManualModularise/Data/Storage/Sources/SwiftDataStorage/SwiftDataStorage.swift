import SwiftData
import Entities
import StorageAPI
import Foundation

public class SwiftDataStorage<Model: PersistentModel>: @preconcurrency StorageAPI {
    private let modelContainer: ModelContainer
    
    required public init(modelContainer: ModelContainer) {
        self.modelContainer = modelContainer
    }
    
    @MainActor public func get() -> [Model] {
        let descriptor = FetchDescriptor<Model>()
        let models = (try? modelContainer.mainContext.fetch(descriptor)) ?? []
        
        return models
    }
    
    @MainActor public func delete(_ model: Model) {
        modelContainer.mainContext.delete(model)
    }
    
    @MainActor public func insert(_ model: Model) {
        modelContainer.mainContext.insert(model)
    }
}
