// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "Hello",
  dependencies: [
    .package(url: "https://github.com/Brightify/Cuckoo.git", revision: "1.10.3"),
  ],
  targets: [
    .executableTarget(
      name: "Hello"
    ),
    .testTarget(
      name: "HelloTests",
      dependencies: [
        "Hello",
        "Cuckoo",
      ]
    ),
  ]
)
