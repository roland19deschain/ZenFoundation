import Foundation

public extension Scanner {
	
	/// Returns a string, scanned as long as characters from a given character set are
	/// encountered, or `nil` if none are found.
	func scanCharacters(
		from set: CharacterSet
	) -> String? {
		var value: NSString? = ""
		
		return scanCharacters(
			from: set,
			into: &value
		) ? value as String? : nil
	}
	
	/// Returns a string, scanned until a character from a given character set are encountered,
	/// or the remainder of the scanner's string. Returns `nil` if the scanner is already `atEnd`.
	func scanUpToCharacters(
		from set: CharacterSet
	) -> String? {
		var value: NSString? = ""
		
		return scanUpToCharacters(
			from: set,
			into: &value
		) ? value as String? : nil
	}
	
	/// Returns the given string if scanned, or `nil` if not found.
	func scan(
		string: String
	) -> String? {
		var value: NSString? = ""
		
		return scanString(
			string,
			into: &value
		) ? value as String? : nil
	}
	
	/// Returns a string, scanned until the given string is found,
	/// or the remainder of the scanner's string. Returns `nil` if the scanner is already `atEnd`.
	func scanUp(to string: String) -> String? {
		var value: NSString? = ""
		
		return scanUpTo(
			string,
			into: &value
		) ? value as String? : nil
	}
	
}
