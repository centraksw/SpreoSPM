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
        .binaryTarget(name: "IndoorKit",
                      path: "IndoorKit.xcframework"),
        .binaryTarget(name: "GoogleMaps",
                      url: "https://github.com/YAtechnologies/GoogleMaps-SP/releases/download/6.0.0/GoogleMaps.xcframework.zip",
                      checksum: "cd775df376017bf507d3f0bdfc29a60ebbe35f58a44333a54a7786c07c546036"
        ),
        .binaryTarget(name: "GoogleMapsBase",
                      url: "https://github.com/YAtechnologies/GoogleMaps-SP/releases/download/6.0.0/GoogleMapsBase.xcframework.zip",
                      checksum: "37bbaf7a16c9495a791166f2ea64835bd8506034deb2f0970ec2c70b98cb310f"
        ),
        .binaryTarget(name: "GoogleMapsCore",
                      url: "https://github.com/YAtechnologies/GoogleMaps-SP/releases/download/6.0.0/GoogleMapsCore.xcframework.zip",
                      checksum: "3c628402426869708f2b160e51526b5088e8d7a398b454ec7cba2ba11729cdb2"
        ),
        .target(name: "SpreoSMP",
                dependencies: [
                    .target(name: "IndoorKit", condition: .when(platforms: .some([.iOS]))),
                    .target(name: "GoogleMaps", condition: .when(platforms: .some([.iOS]))),
                    .target(name: "GoogleMapsBase", condition: .when(platforms: .some([.iOS]))),
                    .target(name: "GoogleMapsCore", condition: .when(platforms: .some([.iOS])))
                ],
                path: "Sources/SpreoSPM",
                resources: [.copy("Resources")]
        )
    ]
)
