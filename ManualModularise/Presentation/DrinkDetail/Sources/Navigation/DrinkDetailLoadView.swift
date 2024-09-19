import Router

public extension Router {
    func loadDrinkDetail() {
        addView(id: DrinkDetailDestination.drinkDetail,
                view: SwiftUIViewModule { params in
            DrinkDetailView(
                viewModel: DrinkDetailViewModel(
                    drink: Drink(name: "", color: "")
                )
            )
        })
    }
}
