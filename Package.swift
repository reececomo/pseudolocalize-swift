// swift-tools-version:5.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "pseudolocalize",
  products: [
    .library(
      name: "pseudolocalize",
      targets: ["pseudolocalize"])
  ],
  dependencies: [],
  targets: [
    .target(
      name: "pseudolocalize",
      dependencies: []),
    .testTarget(
      name: "pseudolocalizeTests",
      dependencies: ["pseudolocalize"])
  ]
)
