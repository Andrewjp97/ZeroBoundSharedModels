// swift-tools-version: 6.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ZeroBoundSharedModels",
    platforms: [
        .macOS(.v15)
    ],
    products: [
        .executable(name: "ZeroBoundSharedModels", targets: ["ZeroBoundSharedModels"])
    ],
    dependencies: [
        // Vapor web framework
    .package(url: "https://github.com/vapor/vapor.git", from: "4.92.0"),
    .package(url: "https://github.com/vapor/fluent.git", from: "4.9.0"),
    .package(url: "https://github.com/vapor/fluent-postgres-driver.git", from: "2.11.0"),
    .package(url: "https://github.com/vapor/postgres-nio.git", from: "1.27.0"),
    .package(url: "https://github.com/apple/swift-crypto.git", from: "3.12.0"),
    .package(url: "https://github.com/swift-server/swift-webauthn.git", from: "1.0.0-alpha.2"),
    .package(url: "https://github.com/apple/swift-certificates.git", from: "1.14.0"),
    .package(url: "https://github.com/apple/swift-openapi-generator", from: "1.6.0"),
    .package(url: "https://github.com/apple/swift-openapi-runtime", from: "1.7.0"),
    .package(url: "https://github.com/apple/swift-openapi-urlsession", from: "1.0.0")
    ],
    targets: [
        .executableTarget(
            name: "ZeroBoundSharedModels",
            dependencies: [
                .product(name: "PostgresNIO", package: "postgres-nio"),
                // Force-resolve Crypto with Extras so PBKDF2 is available to deps:
                .product(name: "_CryptoExtras", package: "swift-crypto"),
                .product(name: "Vapor", package: "vapor"),
                .product(name: "Fluent", package: "fluent"),
                .product(name: "FluentPostgresDriver", package: "fluent-postgres-driver"),
                .product(name: "WebAuthn", package: "swift-webauthn"),
                .product(name: "X509", package: "swift-certificates"),
                .product(name: "OpenAPIRuntime", package: "swift-openapi-runtime"),
                .product(name: "OpenAPIURLSession", package: "swift-openapi-urlsession")
            ],
            path: "Sources",
            plugins: [
                .plugin(name: "OpenAPIGenerator", package: "swift-openapi-generator"),
            ])
    ]
)
