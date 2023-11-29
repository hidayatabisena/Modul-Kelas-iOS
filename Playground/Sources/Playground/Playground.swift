// The Swift Programming Language
// https://docs.swift.org/swift-book

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

