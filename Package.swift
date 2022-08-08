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
                      url: "https://github.com/SpreoLLC/SpreoSPM/releases/download/6.9.12/IndoorKit.xcframework.zip",
                      checksum: "1635acb041f23669794ae3ef653c98d144f47151b8c7e9e810158d4f6d3b9188"),
        .target(name: "SpreoSMP",
                dependencies: [
                    .target(name: "IndoorKit", condition: .when(platforms: .some([.iOS])))
                ],
                path: "Sources/SpreoSPM"
        )
    ]
)
