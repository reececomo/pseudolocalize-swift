// swift-tools-version:5.0

import PackageDescription

let package = Package(
  name: "pseudolocalize",
  products: [
    .library(
      name: "pseudolocalize",
      targets: ["pseudolocalize"]
    )
  ],
  targets: [
    .target(
      name: "pseudolocalize",
      path: "Sources"
    ),
    .testTarget(
      name: "UnitTests",
      dependencies: ["pseudolocalize"],
      path: "Tests"
    )
  ]
)
