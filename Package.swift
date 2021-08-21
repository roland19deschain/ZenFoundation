// swift-tools-version:5.3

import PackageDescription

let package = Package(
	name: "ZenFoundation",
	platforms: [
		.macOS(.v10_10),
		.iOS(.v12),
		.tvOS(.v12),
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
			path: "ZenFoundation/SourceCode/"
		)
	]
)
