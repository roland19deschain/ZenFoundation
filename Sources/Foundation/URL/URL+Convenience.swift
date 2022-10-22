import Foundation

public extension URL {
	
	/// Returns a boolean value that indicates whether the resource is a directory.
	var isDirectory: Bool {
		(try? resourceValues(forKeys: [.isDirectoryKey]))?.isDirectory == true
	}
	
}
