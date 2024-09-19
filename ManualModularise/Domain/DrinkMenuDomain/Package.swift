// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "DrinkMenuDomain",
    platforms: [.iOS(.v17)],
    products: [
        .library(
            name: "DrinkMenuUseCaseAPI",
            targets: ["DrinkMenuUseCaseAPI"]),
        .library(
            name: "DrinkMenuUseCase",
            targets: ["DrinkMenuUseCase"]),
        .library(
            name: "DrinkMenuRepositoryAPI",
            targets: ["DrinkMenuRepositoryAPI"]),
        .library(
            name: "DrinkMenuRepository",
            targets: ["DrinkMenuRepository"]),
    ],
    dependencies: [
        .package(name: "Entities", path: "../Domain/Entities"),
        .package(name: "StorageAPI", path: "../Data/Storage")
    ],
    targets: [
        .target(
            name: "DrinkMenuUseCaseAPI",
            dependencies: [
                "Entities"
            ]),
        .target(
            name: "DrinkMenuUseCase",
            dependencies: [
                "DrinkMenuUseCaseAPI",
                "Entities"
            ]),
        .target(
            name: "DrinkMenuRepositoryAPI",
            dependencies: [
                "Entities",
                "StorageAPI"
            ]),
        .target(
            name: "DrinkMenuRepository",
            dependencies: [
                "DrinkMenuRepositoryAPI",
                "Entities",
                "StorageAPI"
            ]),
        .testTarget(
            name: "DrinkMenuDomainTests",
            dependencies: ["DrinkMenuUseCase"]),
    ]
)
