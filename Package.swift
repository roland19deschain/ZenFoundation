// swift-tools-version:5.9

import PackageDescription

let package = Package(
	name: "ZenFoundation",
	platforms: [
		.iOS(.v12),
		.tvOS(.v12),
		.macOS(.v10_10),
		.watchOS(.v2)
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
