import SwiftUI
import Entities
import DrinkMenuUseCaseAPI
import RouterAPI
import Router

public struct DrinkMenuView<ViewModel> : View where ViewModel: DrinkMenuViewModelling {
    @StateObject private var viewModel: ViewModel
    @EnvironmentObject private var router: Router
    @State private var isInputPromptPresented: Bool = false
    
    public init(viewModel: ViewModel) {
        _viewModel = .init(wrappedValue: viewModel)
    }
    
    public var body: some View {
        VStack {
            LazyVStack {
                Button("Add Drink") {
                    isInputPromptPresented.toggle()
                }
                ForEach(viewModel.items, id: \.name) { item in
                    Text("\(item.name)")
                }
                .navigationDestination(for: Drink.self) { item in
                    router.deliveryView(viewId: DrinkDetailDestination.drinkDetail,
                                        params: ["name": item.name, "color": item.color])
                }
            }
        }
        .task {
            viewModel.loadDrinks()
        }
        .alert("", isPresented: $isInputPromptPresented) {
            TextField("Enter drink name", text: $viewModel.drinkNamePrompt)
            TextField("Enter drink color", text: $viewModel.drinkColorPrompt)
            Button("OK", action: submit)
        } message: {
           Text("Please input a drink")
        }

    }
    
    private func submit() {
        viewModel.insertDrink()
    }
}

#Preview {
    DrinkMenuView<DrinkMenuViewModel>(viewModel: DrinkMenuViewModel(useCase: MockDrinkUseCase()))
}

final class MockDrinkUseCase: DrinkMenuUseCaseAPI {
    func insert(drink: Entities.Drink) {
        
    }
    
    func loadDrinks() -> [Drink] {
        return [Drink(name: "Tea", color: "brown"), Drink(name: "Coke", color: "red")]
    }
}
