import Foundation

public extension URL {
	
	/// Returns a document directory url.
	static var documentDirectoryURL: URL {
		FileManager.default.urls(
			for: .documentDirectory,
			in: .userDomainMask
			)[0]
	}
	
}
