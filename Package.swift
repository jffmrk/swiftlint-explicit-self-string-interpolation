// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "ExplicitSelfStringInterpolationBug",
    products: [
        .library(name: "ExplicitSelfStringInterpolationBug", targets: ["ExplicitSelfStringInterpolationBug"]),
    ],
    targets: [
        .target(name: "ExplicitSelfStringInterpolationBug"),
        .testTarget(
            name: "ExplicitSelfStringInterpolationBugTests",
            dependencies: ["ExplicitSelfStringInterpolationBug"]
        ),
    ]
)
