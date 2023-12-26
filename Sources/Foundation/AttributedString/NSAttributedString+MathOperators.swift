import Foundation

/// Add a NSAttributedString to another NSAttributedString.
public func += (lhs: inout NSAttributedString, rhs: NSAttributedString) {
	let string = NSMutableAttributedString(
		attributedString: lhs
	)
	string.append(rhs)
	lhs = string
}

/// Add a NSAttributedString to another NSAttributedString and return a new NSAttributedString instance.
public func + (lhs: NSAttributedString, rhs: NSAttributedString) -> NSAttributedString {
	let string = NSMutableAttributedString(
		attributedString: lhs
	)
	string.append(rhs)
	return NSAttributedString(attributedString: string)
}

/// Add a String to a NSAttributedString.
public func += (lhs: inout NSAttributedString, rhs: String) {
	lhs += NSAttributedString(string: rhs)
}

/// Add a String to a NSAttributedString and return a new NSAttributedString instance.
public func + (lhs: NSAttributedString, rhs: String) -> NSAttributedString {
	lhs + NSAttributedString(string: rhs)
}
