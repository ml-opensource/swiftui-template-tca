// swift-tools-version: 5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Domain",
    platforms: [.macOS(.v12), .iOS(.v15)],
    products: [
        .library(
            name: "Domain",
            targets: ["Domain"]),
    ],
    dependencies: [
    ],
    targets: [
        .target(
            name: "Domain",
            dependencies: [])
    ]
)
