import Foundation
import DrinkMenuUseCaseAPI
import Entities

public protocol DrinkMenuViewModeling {
    var items: [Drink] { get set }
    
    var useCase: DrinkMenuUseCaseAPI { get }
    func loadDrinks()
}

public final class DrinkMenuViewModel: ObservableObject {
    @Published var items: [Drink] = []
    
    private let useCase: DrinkMenuUseCaseAPI
    
    public init(useCase: DrinkMenuUseCaseAPI) {
        self.useCase = useCase
    }
    
    func loadDrinks(){
        items = useCase.loadDrinks()
    }
}
