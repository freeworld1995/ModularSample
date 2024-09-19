import DrinkMenuUseCaseAPI
import Entities
import StorageAPI
import DrinkMenuRepositoryAPI

public final class DrinkMenuUseCase: DrinkMenuUseCaseAPI {
    private var repository: DrinkMenuRepositoryAPI
    
    public init(repository: DrinkMenuRepositoryAPI) {
        self.repository = repository
    }
    
    public func loadDrinks() -> [Drink] {
        repository.loadDrinks()
    }
    
    public func insert(drink: Drink) {
        repository.insert(drink: drink)
    }
    
}
