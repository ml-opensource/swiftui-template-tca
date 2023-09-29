// swift-tools-version: 5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Utilities",
    platforms: [.macOS(.v12), .iOS(.v15)],
    products: [
        .library(
            name: "Utilities",
            targets: ["Utilities"]),
    ],
    dependencies: [
       
    ],
    targets: [
        .target(
            name: "Utilities",
            dependencies: [])
    ]
)
