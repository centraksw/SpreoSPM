// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SpreoSMP",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        .library(
            name: "SpreoSMP",
            type: .dynamic,
            targets: ["SpreoSMP"]
        )
    ],
    targets: [
        .binaryTarget(name: "IndoorKit", path: "IndoorKit.xcframework"),
        .target(name: "SpreoSMP",
                dependencies: [
                    .target(name: "IndoorKit", condition: .when(platforms: .some([.iOS])))
                ],
                path: "Sources/SpreoSPM"
        )
    ]
)
