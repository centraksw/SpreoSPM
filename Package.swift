// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SpreoSMP",
    platforms: [
        .iOS(.v11)
    ],
    products: [
        .library(
            name: "SpreoSMP",
            targets: ["SpreoSMP"]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/YAtechnologies/GoogleMaps-SP.git", .upToNextMinor(from: "6.0.0"))
    ],
    targets: [
        .binaryTarget(name: "IndoorKit", path: "IndoorKit.xcframework"),
        .target(name: "SpreoSMP",
                dependencies: [
                    .target(name: "IndoorKit", condition: .when(platforms: .some([.iOS]))),
                    .product(name: "GoogleMaps", package: "GoogleMaps-SP")
                ],
                path: "Sources/SpreoSPM",
                resources: [.copy("IndoorKit.bundle")]
        )
    ]
)
