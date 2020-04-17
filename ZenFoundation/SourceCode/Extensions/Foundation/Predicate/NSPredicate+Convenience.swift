import Foundation

public extension NSPredicate {
	
	/// Returns a new predicate formed by NOT-ing a given predicate.
	var not: NSPredicate {
		NSCompoundPredicate(notPredicateWithSubpredicate: self)
	}
	
	/// Returns a new predicate formed by AND-ing the argument to the predicate.
	func and(_ predicate: NSPredicate) -> NSPredicate {
		NSCompoundPredicate(andPredicateWithSubpredicates: [
			self,
			predicate
		])
	}
	
	/// Returns a new predicate formed by OR-ing the argument to the predicate.
	func or(_ predicate: NSPredicate) -> NSPredicate {
		NSCompoundPredicate(orPredicateWithSubpredicates: [
			self,
			predicate
		])
	}
	
}

public extension NSPredicate {
	
	/**
	Returns a predicate that evaluates whether the value in specified keypath equal to the value specified as second argument.
	- parameter keyPath: The keypath to field.
	- parameter value: The value to compare.
	*/
	static func equal<Value: CVarArg>(
		keyPath: String,
		value: Value
	) -> NSPredicate {
		if type(of: value) == String.self {
			return NSPredicate(format: "%K == %@", keyPath, value)
		} else {
			return NSPredicate(format: "%K == \(value)", keyPath)
		}
	}
	
	/**
	Returns a predicate that evaluates whether the collection contains the value in specified keypath.
	- parameter keyPath: The keypath to field.
	- parameter value: The collection where to search.
	*/
	static func contain<Values: Collection>(
		keyPath: String,
		values: Values
	) -> NSPredicate where Values: CVarArg, Values.Element: CVarArg {
		guard values.count == 1,
			let first = values.first else {
				return NSPredicate(format: "%K IN %@", keyPath, values)
		}
		return equal(
			keyPath: keyPath,
			value: first
		)
	}
	
	/**
	Returns a predicate that evaluates whether the relation contains more entities than specified count.
	- parameter relationKeyPath: The keypath to _to-many_ relationship.
	- parameter count: The number to compare with entities count.
	*/
	static func contain(
		relationKeyPath: String,
		moreThan count: Int
	) -> NSPredicate {
		NSPredicate(format: "%K.@count > \(count)", relationKeyPath)
	}
	
	/**
	Returns a predicate that evaluates whether the value in specified keypath is within specified range.
	- parameter keyPath: The keypath to field.
	- parameter range: The allowable range.
	*/
	static func within(
		keyPath: String,
		range: CountableClosedRange<Int>
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
	static func within(
		keyPath: String,
		range: CountableRange<Int>
	) -> NSPredicate {
		NSPredicate(
			format: "%K >= %@ && %K < %@",
			keyPath, range.lowerBound,
			keyPath, range.upperBound
		)
	}
	
}
