// swift-tools-version:5.3

import PackageDescription

let package = Package(

  name: "SnapshotTestingUI",
  
  platforms: [
    .macOS(.v11),
    .iOS(.v14),
    .tvOS(.v14)
  ],
  
  products: [
    .library(
      name: "SnapshotTestingUI",
      targets: ["SnapshotTestingUI"]
    ),
  ],
  
  dependencies: [
  ],
  
  targets: [
    .target(
      name: "SnapshotTestingUI",
      dependencies: []
    ),
    .testTarget(
      name: "SnapshotTestingUITests",
      dependencies: ["SnapshotTestingUI"]
    ),
  ]
)
