import Entities

public protocol DrinkMenuUseCaseAPI {
    func loadDrinks() -> [Drink]
}
