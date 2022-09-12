// swift-tools-version:5.6

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
        .package(url: "https://github.com/bdrelling/InstrumentKit", .upToNextMinor(from: "0.1.7")),
        .package(url: "https://github.com/bdrelling/PlotVapor", .upToNextMinor(from: "0.4.1")),
        .package(url: "https://github.com/bdrelling/VaporExtensions", .upToNextMinor(from: "0.2.0")),
        .package(url: "https://github.com/vapor-community/vapor-sitemap", from: "1.1.0"),
        // Development
        .package(url: "https://github.com/swift-kipple/Tools", from: "0.3.2"),
    ],
    targets: [
        .target(
            name: "App",
            dependencies: [
                .product(name: "InstrumentKit", package: "InstrumentKit"),
                .product(name: "PlotVapor", package: "PlotVapor"),
                .product(name: "Vapor", package: "vapor"),
                .product(name: "VaporExtensions", package: "VaporExtensions"),
                .product(name: "VaporSitemap", package: "vapor-sitemap"),
            ],
            swiftSettings: [
                // Enable better optimizations when building in Release configuration. Despite the use of
                // the `.unsafeFlags` construct required by SwiftPM, this flag is recommended for Release
                // builds. See <https://github.com/swift-server/guides/blob/main/docs/building.md#building-for-production> for details.
                .unsafeFlags(["-cross-module-optimization"], .when(configuration: .release)),
            ]
        ),
        .executableTarget(
            name: "Run",
            dependencies: [
                .target(name: "App"),
            ]
        ),
    ]
)
