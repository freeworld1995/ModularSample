import Foundation

public protocol DrinkMenuUseCaseAPI {
    func loadDrinks() -> [Drink]
}
