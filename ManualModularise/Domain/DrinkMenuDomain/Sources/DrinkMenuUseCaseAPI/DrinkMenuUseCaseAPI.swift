import Entities

public protocol DrinkMenuUseCaseAPI {
    func loadDrinks() -> [Drink]
    func insert(drink: Drink)
}
