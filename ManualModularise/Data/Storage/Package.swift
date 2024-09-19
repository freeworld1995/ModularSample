// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Storage",
    platforms: [.iOS(.v17)],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "StorageAPI",
            targets: ["StorageAPI"]),
        .library(
            name: "SwiftDataStorage",
            targets: ["SwiftDataStorage"]),
        .library(
            name: "UserDefaultStorage",
            targets: ["UserDefaultStorage"]),
    ],
    dependencies: [.package(name: "Entities", path: "../Domain/Entities")],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "StorageAPI"),
        .target(
            name: "SwiftDataStorage", dependencies: ["Entities", "StorageAPI"]),
        .target(
            name: "UserDefaultStorage", dependencies: ["Entities", "StorageAPI"]),
        
        
        .testTarget(
            name: "DatabaseSwiftDataTests",
            dependencies: ["SwiftDataStorage"]),
    ]
)
