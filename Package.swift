// swift-tools-version: 6.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

#if swift(>=5.9)
let digitalOceanAppPlatform: Platform = .custom("digitalOceanApp")
#else
let digitalOceanAppPlatform = Platform.custom("digitalOceanApp")
#endif

let package = Package(
    name: "ZeroBoundSharedModels",
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "ZeroBoundSharedModels",
            targets: ["ZeroBoundSharedModels"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/vapor/fluent-kit.git", from: "1.0.0"),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "ZeroBoundSharedModels",
            dependencies: [
                .product(
                    name: "FluentKit",
                    package: "fluent-kit",
                    condition: .when(platforms: [digitalOceanAppPlatform])
                )
            ]
        ),
    ]
)
