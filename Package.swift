// swift-tools-version:5.0

import PackageDescription

let package = Package(
    name: "S3PA",
    products: [
        .library(name: "S3PA", targets: ["App"]),
    ],
    dependencies: [
        // 💧 A server-side Swift web framework.
        .package(url: "https://github.com/vapor/vapor.git", from: "3.0.0"),
        .package(url: "https://github.com/vapor/leaf.git", from: "3.0.0"),
        .package(url: "https://github.com/vapor/fluent-mysql.git", from: "3.0.0")
    ],
    targets: [
        .target(name: "App", dependencies: ["FluentMySQL", "Leaf", "Vapor"]),
        .target(name: "Run", dependencies: ["App"]),
        .testTarget(name: "AppTests", dependencies: ["App"])
    ]
)

