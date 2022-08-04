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
        .binaryTarget(name: "IndoorKit",
                      url: "https://github.com/SpreoLLC/SpreoSPM/releases/download/6.9.11.1/IndoorKit.xcframework.zip",
                      checksum: "1824d359b6a40b10cab79b96a81fc881a825f20a5aef7212ec5137f64d510954"),
        .target(name: "SpreoSMP",
                dependencies: [
                    .target(name: "IndoorKit", condition: .when(platforms: .some([.iOS])))
                ],
                path: "Sources/SpreoSPM"
        )
    ]
)
