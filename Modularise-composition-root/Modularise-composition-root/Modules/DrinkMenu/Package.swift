// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "DrinkMenu",
    products: [
        .library(
            name: "DrinkMenuData",
            targets: ["DrinkMenuData"]),
        .library(
            name: "DrinkMenuDomain",
            targets: ["DrinkMenuDomain"]),
        .library(
            name: "DrinkMenuUI",
            targets: ["DrinkMenuUI"]),
    ],
    targets: [
        .target(name: "DrinkMenuData", dependencies: []),
        .target(name: "DrinkMenuDomain"),
        .target(
            name: "DrinkMenuUI"),
        .testTarget(
            name: "DrinkMenuTests",
            dependencies: ["DrinkMenuUI"]),
    ]
)
