// swift-tools-version: 5.7

import PackageDescription

let package = Package(
    name: "Vapi",
    platforms: [
        .iOS(.v15),
        .macOS(.v12),
        .tvOS(.v15),
        .watchOS(.v8)
    ],
    products: [
        .library(
            name: "Vapi",
            targets: ["Vapi"]
        )
    ],
    dependencies: [],
    targets: [
        .target(
            name: "Vapi",
            path: "Sources"
        ),
        .testTarget(
            name: "VapiTests",
            dependencies: ["Vapi"],
            path: "Tests"
        )
    ]
)
