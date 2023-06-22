// swift-tools-version:5.7

import PackageDescription

let package = Package(
    name: "LicenseUI",
    defaultLocalization: "en",
    platforms: [.iOS(.v14)],
    products: [
        .library(
            name: "LicenseUI",
            targets: ["LicenseUI"]
        ),
    ],
    dependencies: [
        
    ],
    targets: [
        .target(
            name: "LicenseUI",
            dependencies: []
        ),
        .testTarget(
            name: "LicenseUITests",
            dependencies: ["LicenseUI"]
        ),
    ]
)
