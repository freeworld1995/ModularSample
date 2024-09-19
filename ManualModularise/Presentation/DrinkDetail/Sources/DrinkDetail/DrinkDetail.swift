import SwiftUI
import Entities

public struct DrinkDetailView<ViewModel> : View where ViewModel: DrinkDetailViewModelling {
    @StateObject private var viewModel: ViewModel
    
    public init(viewModel: ViewModel) {
        _viewModel = .init(wrappedValue: viewModel)
    }
    
    public var body: some View {
        VStack {
            Spacer()
            Text(viewModel.drink.name)
            Spacer()
        }
        .background(Color.init(viewModel.drink.color))
    }
}

#Preview {
    DrinkDetailView(viewModel: DrinkDetailViewModel(drink: Drink(name: "Tea", color: "brown")))
}
