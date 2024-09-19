import Foundation
import DrinkMenuUseCaseAPI
import Entities

public protocol DrinkMenuViewModelling: ObservableObject {
    var items: [Drink] { get set }
    var drinkNamePrompt: String { get set }
    var drinkColorPrompt: String { get set }
    var useCase: DrinkMenuUseCaseAPI { get }
    
    func loadDrinks()
    func insertDrink()
}

public final class DrinkMenuViewModel: DrinkMenuViewModelling {
    @Published public var items: [Drink] = []
    @Published public var drinkNamePrompt: String = ""
    @Published public var drinkColorPrompt: String = ""
    
    public let useCase: DrinkMenuUseCaseAPI
    
    public init(useCase: DrinkMenuUseCaseAPI) {
        self.useCase = useCase
    }
    
    public func loadDrinks(){
        items = useCase.loadDrinks()
    }
    
    public func insertDrink() {
        guard !drinkNamePrompt.isEmpty, !drinkColorPrompt.isEmpty else { return }
        useCase.insert(drink: Drink(name: drinkNamePrompt, color: drinkColorPrompt))
        
        loadDrinks()
    }
}
