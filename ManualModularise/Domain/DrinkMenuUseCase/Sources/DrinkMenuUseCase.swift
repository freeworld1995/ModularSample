import DrinkMenuUseCaseAPI
import Entities
import DatabaseSwiftData

public final class DrinkMenuUseCase: DrinkMenuUseCaseAPI {
    private let database: DatabaseAPI
    
    public init(database: DatabaseAPI) {
        self.database = database
    }
    
    public func loadDrinks() -> [Drink] {
        let drinks: [Drink] = database.getItem()
        
        return drinks
    }
}
