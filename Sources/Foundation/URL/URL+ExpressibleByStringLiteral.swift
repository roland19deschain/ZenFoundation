import Foundation

extension URL: ExpressibleByStringLiteral {

	/// Creates non-optional URLs using compile time static strings.
	public init(stringLiteral value: StaticString) {
		self.init(string: "\(value)")!
	}

}
