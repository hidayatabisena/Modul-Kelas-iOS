// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "GenerativeArt",
    dependencies: [
        .package(url: "https://github.com/apple/swift-argument-parser", from: "0.4.4")
    ],
    targets: [
        .target(
            name: "GenerativeArt",
            dependencies: [.product(name: "ArgumentParser", package: "swift-argument-parser")])
    ]
)

