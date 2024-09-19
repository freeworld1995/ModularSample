import Foundation
import SwiftData
import Entities
import UserDefaultStorage

import Router
import RouterAPI

class MockFeatureSwitch {
    enum FeatureSwitch {
        case shouldUseUserDefaultsStorage
    }
    
    private let shouldUseUserDefaultsStorage: Bool = false
    
    func isFeatureEnabled(for featureSwitch: FeatureSwitch) -> Bool {
        switch featureSwitch {
        case .shouldUseUserDefaultsStorage:
            return shouldUseUserDefaultsStorage
        }
    }
}

final class CompositionRoot {
    let featureSwitch = MockFeatureSwitch()
    let router: Router
    
    init(router: Router) {
        self.router = router
    }
    
    lazy var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Drink.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()
    
    func registerRoutes() {
//        router.register(route: Route(path: "DrinkMenu", destination: createDrinkMenu()))
    }
}
