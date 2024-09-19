// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "DrinkMenu",
    platforms: [.iOS(.v17)],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "DrinkMenu",
            targets: ["DrinkMenu"]),
    ],
    dependencies: [
        .package(name: "DrinkMenuUseCaseAPI", path: "../Domain/DrinkMenuDomain"),
        .package(name: "Router", path: "../Presentation/Router")
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "DrinkMenu",
            dependencies: ["DrinkMenuUseCaseAPI", "Router"]),
        .testTarget(
            name: "DrinkMenuTests",
            dependencies: ["DrinkMenu"]),
    ]
)
