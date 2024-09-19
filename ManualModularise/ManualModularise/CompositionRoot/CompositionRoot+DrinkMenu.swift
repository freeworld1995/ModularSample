import DrinkMenu
import DrinkMenuUseCase
import DrinkMenuRepository
import SwiftDataStorage
import UserDefaultStorage
import Entities
import Router

extension CompositionRoot {
    func createDrinkMenu() -> DrinkMenuView<DrinkMenuViewModel> {
        if featureSwitch.isFeatureEnabled(for: .shouldUseUserDefaultsStorage) {
            return DrinkMenuView(
                viewModel: DrinkMenuViewModel(
                    useCase: DrinkMenuUseCase(
                        repository: DrinkMenuRepository(
                            storage: UserDefaultStorage<Drink>()
                        )
                    )
                )
            )
        } else {
            return DrinkMenuView(
                viewModel: DrinkMenuViewModel(
                    useCase: DrinkMenuUseCase(
                        repository: DrinkMenuRepository(
                            storage: SwiftDataStorage<Drink>(
                                modelContainer: sharedModelContainer
                            )
                        )
                    )
                )
            )
        }
    }
}
