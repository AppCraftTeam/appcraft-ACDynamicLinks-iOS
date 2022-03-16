// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ACDynamicLink",
    platforms: [
        .iOS(.v11)
        ],
    products: [
        .library(
            name: "ACDynamicLink",
            targets: ["ACDynamicLink"]),
    ],
    dependencies: [
        .package(name: "Firebase", url: "https://github.com/firebase/firebase-ios-sdk.git", .upToNextMinor(from: "8.0.0"))
    ],
    targets: [
        .target(
            name: "ACDynamicLink",
            dependencies: [
                .product(name: "FirebaseDynamicLinks", package: "Firebase")
            ]),
        .testTarget(
            name: "ACDynamicLinkTests",
            dependencies: ["ACDynamicLink"]),
    ]
)
