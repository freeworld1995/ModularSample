import DrinkDetail
import Entities

extension CompositionRoot {
    func createDrinkDetail(with drink: Drink) -> DrinkDetailView<DrinkDetailViewModel> {
        return DrinkDetailView(
            viewModel: DrinkDetailViewModel(
                drink: drink
            )
        )
    }
}
