// swift-tools-version: 5.10

import PackageDescription

let package = Package(
	name: "ZenFoundation",
	platforms: [
		.iOS(.v14),
		.tvOS(.v14),
		.macOS(.v10_15),
		.watchOS(.v6)
	],
	products: [
		.library(
			name: "ZenFoundation",
			type: .static,
			targets: ["ZenFoundation"]
		)
	],
	dependencies: [],
	targets: [
		.target(
			name: "ZenFoundation",
			dependencies: [],
			path: "Sources/"
		),
		.testTarget(
			name: "ZenFoundationTests",
			dependencies: ["ZenFoundation"],
			path: "Tests/"
		)
	],
	swiftLanguageVersions: [.v5]
)
