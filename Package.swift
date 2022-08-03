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
            type: .dynamic,
            targets: ["SpreoSMP"]
        )
    ],
    targets: [
        .binaryTarget(name: "IndoorKit",
                      url: "https://github.com/SpreoLLC/SpreoSPM/releases/download/6.9.11/IndoorKit.xcframework.zip",
                      checksum: "019d1908a80212f74e773971202c6abbe3ac7c8a9888ba275701245bab4ce17c"
        ),
        .target(name: "SpreoSMP",
                dependencies: [
                    .target(name: "IndoorKit", condition: .when(platforms: .some([.iOS]))),
                ],
                path: "Sources/SpreoSPM"
        )
    ]
)
