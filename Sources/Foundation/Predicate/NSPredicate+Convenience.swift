import Foundation

public extension NSPredicate {
	
	/// Returns a predicate that always evaluates _true_.
	static var alwaysTrue: NSPredicate {
		NSPredicate(value: true)
	}
	
	/// Returns a predicate that always evaluates _false_.
	static var alwaysFalse: NSPredicate {
		NSPredicate(value: false)
	}
	
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
