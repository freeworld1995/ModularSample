import SwiftData
import Entities

public protocol DatabaseAPI {
    init(modelContainer: ModelContainer)
    
    func getItem<Model: PersistentModel>() -> [Model]
}

public class DatabaseSwiftData: DatabaseAPI {
    private let modelContainer: ModelContainer
    
    required public init(modelContainer: ModelContainer) {
        self.modelContainer = modelContainer
    }
    
//    func setup() {
//        var sharedModelContainer: ModelContainer = {
//            let schema = Schema([
//                Drink.self,
//            ])
//            let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)
//
//            do {
//                return try ModelContainer(for: schema, configurations: [modelConfiguration])
//            } catch {
//                fatalError("Could not create ModelContainer: \(error)")
//            }
//        }()
//    }
    
    @MainActor public func getItem<Model: PersistentModel>() -> [Model] {
        let descriptor = FetchDescriptor<Model>()
        let models = (try? modelContainer.mainContext.fetch(descriptor)) ?? []
        
        return models
    }
    
//    func get() -> [some Item] {
//        let descriptor = FetchDescriptor<Item>()
//           let users = (try? container?.mainContext.fetch(descriptor)) ?? []
//    }
}
