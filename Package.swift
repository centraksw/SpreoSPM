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
    targets: [
        .binaryTarget(name: "IndoorKit", path: "IndoorKit.xcframework"),
        .binaryTarget(name: "GoogleMaps", path: "GoogleMaps.xcframework"),
        .binaryTarget(name: "GoogleMapsBase", path: "GoogleMapsBase.xcframework"),
        .binaryTarget(name: "GoogleMapsCore", path: "GoogleMapsCore.xcframework"),
        .target(name: "SpreoSMP",
                dependencies: [
                    .target(name: "IndoorKit", condition: .when(platforms: .some([.iOS]))),
                    .target(name: "GoogleMaps", condition: .when(platforms: .some([.iOS]))),
                    .target(name: "GoogleMapsBase", condition: .when(platforms: .some([.iOS]))),
                    .target(name: "GoogleMapsCore", condition: .when(platforms: .some([.iOS])))
                ],
                path: "Sources/SpreoSPM",
                resources: [.copy("IndoorKit.bundle"),
                            .copy("GoogleMaps.bundle")]
        )
    ]
)
