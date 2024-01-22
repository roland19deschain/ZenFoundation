import Foundation

public extension URL {
	
	/// Returns a document directory url.
	static var documentDirectory: URL {
		FileManager.default.urls(
			for: .documentDirectory,
			in: .userDomainMask
		)[0]
	}
	
	/// Returns a document directory url.
	static var cachesDirectory: URL {
		FileManager.default.urls(
			for: .cachesDirectory,
			in: .userDomainMask
		)[0]
	}
	
	/// Returns a temporary directory url.
	static var temporaryDirectory: URL {
		URL(
			fileURLWithPath: NSTemporaryDirectory(),
			isDirectory: true
		)
	}
	
	/// Returns the url to either the user’s or application’s home directory.
	static var homeDirectory: URL {
		URL(fileURLWithPath: NSHomeDirectory())
	}
	
}
