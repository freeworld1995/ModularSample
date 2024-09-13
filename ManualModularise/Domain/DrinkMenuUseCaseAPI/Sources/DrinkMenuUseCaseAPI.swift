import Entities

public protocol DrinkMenuUseCaseAPI {
    func loadDrinks() -> [Drinkable]
}
