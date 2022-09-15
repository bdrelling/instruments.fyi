// swift-tools-version:5.7

import PackageDescription

let package = Package(
    name: "InstrumentsFYI",
    platforms: [
        .macOS(.v12),
    ],
    dependencies: [
        // 💧 Vapor
        .package(url: "https://github.com/vapor/vapor", from: "4.63.0"),
        // External
        .package(url: "https://github.com/bdrelling/InstrumentKit", .upToNextMinor(from: "0.4.0")),
        .package(url: "https://github.com/bdrelling/Structure", .upToNextMinor(from: "0.3.11")),
        // Development
        .package(url: "https://github.com/swift-kipple/Tools", from: "0.3.2"),
    ],
    targets: [
        .executableTarget(
            name: "Run",
            dependencies: [
                .target(name: "App"),
            ]
        ),
        .target(
            name: "API",
            dependencies: [
                .product(name: "InstrumentKit", package: "InstrumentKit"),
                .product(name: "Structure", package: "Structure"),
                .product(name: "Vapor", package: "vapor"),
            ]
        ),
        .target(
            name: "App",
            dependencies: [
                .product(name: "InstrumentKit", package: "InstrumentKit"),
                .product(name: "Structure", package: "Structure"),
                .product(name: "Vapor", package: "vapor"),
                .target(name: "API"),
            ],
            swiftSettings: [
                // Enable better optimizations when building in Release configuration. Despite the use of
                // the `.unsafeFlags` construct required by SwiftPM, this flag is recommended for Release
                // builds. See <https://github.com/swift-server/guides/blob/main/docs/building.md#building-for-production> for details.
                .unsafeFlags(["-cross-module-optimization"], .when(configuration: .release)),
            ]
        ),
    ]
)
