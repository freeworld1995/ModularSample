import SwiftUI
import Entities
import DrinkMenuUseCaseAPI

struct SwiftUIView: View {
    @StateObject var viewModel: DrinkMenuViewModel
    
    var body: some View {
        VStack {
            LazyVStack {
                ForEach(viewModel.items, id: \.name) { item in
                    Text("\(item.name)")
                }
            }
        }
        .task {
            viewModel.loadDrinks()
        }
    }
}

#Preview {
    SwiftUIView(viewModel: DrinkMenuViewModel(useCase: MockDrinkUseCase()))
}

final class MockDrinkUseCase: DrinkMenuUseCaseAPI {
    func loadDrinks() -> [Drink] {
        return [Drink(name: "Tea"), Drink(name: "Coke")]
    }
}
