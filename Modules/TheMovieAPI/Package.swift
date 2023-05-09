// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "TheMovieAPI",
    platforms: [
        .iOS(.v14),
    ],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "TheMovieAPI",
            targets: ["TheMovieAPI"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        .package(path: "../Basement"),
        .package(url: "https://github.com/Alamofire/Alamofire.git", exact: "5.6.2"),
        .package(url: "https://github.com/SwiftyJSON/SwiftyJSON.git", exact: "5.0.1"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "TheMovieAPI",
            dependencies: [
                "Alamofire",
                "SwiftyJSON",
                "Basement",
            ]),
        .testTarget(
            name: "TheMovieAPITests",
            dependencies: ["TheMovieAPI"]),
    ]
)