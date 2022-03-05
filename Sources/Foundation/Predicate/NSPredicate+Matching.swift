import Foundation

public extension NSPredicate {
	
	/**
	 Returns a predicate that evaluates whether the value in specified keypath equal to the value specified as second argument.
	 - parameter keyPath: The keypath to field.
	 - parameter value: The value to compare.
	 */
	static func keyPath(
		_ keyPath: String,
		equalTo value: CVarArg
	) -> NSPredicate {
		if type(of: value) == String.self {
			return NSPredicate(format: "%K == %@", keyPath, value)
		} else {
			return NSPredicate(format: "%K == \(value)", keyPath)
		}
	}
	
	/**
	 Returns a predicate that evaluates whether the collection contains the value in specified keypath.
	 - parameter values: The collection where to search.
	 - parameter keyPath: The keypath to field.
	 */
	static func values(
		_ values: [CVarArg],
		contains keyPath: String
	) -> NSPredicate {
		guard
			values.count == 1,
			let first = values.first
		else {
			return NSPredicate(format: "%K IN %@", keyPath, values)
		}
		return self.keyPath(
			keyPath,
			equalTo: first
		)
	}
	
	/**
	 Returns a predicate that evaluates whether the value inmore than specified keypath is within specified range.
	 - parameter keyPath: The keypath to field.
	 - parameter range: The allowable range.
	 */
	static func keyPath(
		_ keyPath: String,
		within range: CountableClosedRange<Int>
	) -> NSPredicate {
		NSPredicate(
			format: "%K >= %@ && %K <= %@",
			keyPath, range.lowerBound,
			keyPath, range.upperBound
		)
	}
	
	/**
	 Returns a predicate that evaluates whether the value in specified keypath is within specified range.
	 - parameter keyPath: The keypath to field.
	 - parameter range: The allowable range.
	 */
	static func keyPath(
		_ keyPath: String,
		within range: CountableRange<Int>
	) -> NSPredicate {
		NSPredicate(
			format: "%K >= %@ && %K < %@",
			keyPath, range.lowerBound,
			keyPath, range.upperBound
		)
	}
	
}
