// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "DrinkDetail",
    platforms: [.iOS(.v17)],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "DrinkDetail",
            targets: ["DrinkDetail"]),
        .library(
            name: "DrinkDetailAPI",
            targets: ["DrinkDetailAPI"]),
    ],
    dependencies: [
        .package(name: "Entities", path: "../Domain/Entities"),
        .package(name: "Router", path: "../Presentation/Router"),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "DrinkDetail",
        dependencies: ["Entities", "Router"]),
        .target(
            name: "DrinkDetailAPI"),
        .testTarget(
            name: "DrinkDetailTests",
            dependencies: ["DrinkDetail"]),
    ]
)
