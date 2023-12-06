// swift-tools-version: 5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Features",
    platforms: [.macOS(.v12), .iOS(.v15)],
    products: [
        .library(
            name: "Features",
            targets: ["Features"]),
    ],
    dependencies: [
        .package(
            url: "https://github.com/pointfreeco/swift-composable-architecture",
            exact: "1.5.1"
        ),
    ],
    targets: [
        .target(
            name: "Features",
            dependencies: []),
        .testTarget(
            name: "FeaturesTests",
            dependencies: ["Features"]),
    ]
)
