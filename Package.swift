// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "AuxiliarySwiftExtensions",
    platforms: [
        .macOS(.v10_15), .iOS(.v12), .tvOS(.v14)
    ],
    products: [
        .library(
            name: "AuxiliarySwiftExtensions",
            targets: ["AuxiliarySwiftExtensions"])
    ],
    targets: [
        .binaryTarget(
            name: "AuxiliarySwiftExtensions",
            path: "./Sources/AuxiliarySwiftExtensions.xcframework")
    ]
)
