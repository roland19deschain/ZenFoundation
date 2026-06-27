import Foundation

public extension Scanner {
	
	/// Returns the given string if scanned, or `nil` if not found.
	func scan(
		string: String
	) -> String? {
		scanString(string)
	}
	
	/// Returns a string, scanned until the given string is found,
	/// or the remainder of the scanner's string. Returns `nil` if the scanner is already `atEnd`.
	func scanUp(to string: String) -> String? {
		scanUpToString(string)
	}
	
}
