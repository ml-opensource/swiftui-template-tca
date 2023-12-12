// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Features",
    platforms: [.macOS(.v12), .iOS(.v15)],
    products: [
        .library(
            name: "App",
            targets: ["App"]
        ),
        
            .library(
                name: "Counter",
                targets: ["Counter"]
            )
    ],
    dependencies: [
        .package(path: "../Common"),
        .package(
            url: "https://github.com/pointfreeco/swift-composable-architecture",
            exact: "1.5.1"
        ),
    ],
    targets: [
        .target(
            name: "App",
            dependencies: [
                "Counter",
                .product(name: "Common", package: "Common"),
                .product(name: "ComposableArchitecture", package: "swift-composable-architecture"),
            ]
        ),
        
            .target(
                name: "Counter",
                dependencies: [
                    .product(name: "Common", package: "Common"),
                    .product(name: "ComposableArchitecture", package: "swift-composable-architecture"),
                ]
            )
    ]
)
