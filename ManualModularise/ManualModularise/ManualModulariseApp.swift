import SwiftUI
import SwiftData

import DrinkDetail
import DrinkMenu
import DrinkMenuUseCase
import DrinkMenuRepository

import SwiftDataStorage
import StorageAPI

import Entities

import Router

@main
struct ManualModulariseApp: App {
    let compositionRoot: CompositionRoot = CompositionRoot(router: Router())
    
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                compositionRoot.createDrinkMenu()
            }
        }
    }
    
}
