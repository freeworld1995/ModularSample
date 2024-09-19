import DrinkMenuRepositoryAPI
import Entities
import StorageAPI

public final class DrinkMenuRepository<Storage: StorageAPI>: DrinkMenuRepositoryAPI {
    private var storage: Storage
    
    public init(storage: Storage) {
        self.storage = storage
    }
    
    public func loadDrinks() -> [Drink] {
        let drinks: [Drink] = storage.get() as? [Drink] ?? []
        
        return drinks
    }
    
    public func insert(drink: Drink) {
        storage.insert(drink as! Storage.Model)
    }
    
}
