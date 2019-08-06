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
        // 🔵 Swift ORM (queries, models, relations, etc) built on SQLite 3.
        .package(url: "https://github.com/vapor/fluent-sqlite.git", from: "3.0.0"),
        .package(url: "https://github.com/vapor/leaf.git", from: "3.0.0"),
        
        .package(url: "/Users/andresilva/dev/swift/UIKit", .branch("master"))
    ],
    targets: [
        .target(name: "App", dependencies: ["FluentSQLite", "Leaf", "UIKit", "Vapor"]),
        .target(name: "Run", dependencies: ["App"]),
        .testTarget(name: "AppTests", dependencies: ["App"])
    ]
)

