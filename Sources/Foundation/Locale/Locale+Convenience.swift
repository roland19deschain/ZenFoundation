import Foundation

public extension Locale {
	
	/// Return the alphabet for the locale, or nil if has none.
	var alphabet: [Character]? {
		exemplarCharacterSet?.characters
	}
	
}
