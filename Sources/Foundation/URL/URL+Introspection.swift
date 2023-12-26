import Foundation

public extension URL {
	
	/// Returns a boolean value that indicates whether the resource is a directory.
	var isDirectory: Bool {
		get throws {
			try resourceValues(forKeys: [.isDirectoryKey]).isDirectory == true
		}
	}
	
	/// Returns a boolean value that indicates whether the resource is reachable.
	var isReachable: Bool {
		get throws {
			try checkResourceIsReachable()
		}
	}
	
}
