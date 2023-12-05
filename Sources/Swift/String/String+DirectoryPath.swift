import Foundation

public extension String {
	
	/// Returns a new string in which 'Document ' directory path are added as a prefix.
	var includingDocumentDirectoryPath: String {
		URL.documentDirectory.appendingPathComponent(
			self
		).absoluteString
	}
	
	/// Returns a new string in which 'Document ' directory path are replaced by empty string.
	var excludingDocumentDirectoryPath: String {
		replacingOccurrences(
			of: URL.documentDirectory.absoluteString,
			with: ""
		)
	}
	
}
