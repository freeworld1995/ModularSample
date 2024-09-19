import Foundation
import Entities

public protocol DrinkDetailViewModelling: ObservableObject {
    var drink: Drink { get }
}

public final class DrinkDetailViewModel: DrinkDetailViewModelling {
    @Published public var drink: Drink
    
    public init(drink: Drink) {
        self.drink = drink
    }
}
