import Entities

public protocol DrinkMenuRepositoryAPI {
    func loadDrinks() -> [Drink]
    func insert(drink: Drink)
}
