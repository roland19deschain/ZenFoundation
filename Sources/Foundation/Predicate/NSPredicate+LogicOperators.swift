import Foundation

/// Returns a new predicate formed by AND-ing the argument to the predicate.
public func && (lhs: NSPredicate, rhs: NSPredicate) -> NSPredicate {
	lhs.and(rhs)
}

/// Returns a new predicate formed by OR-ing the argument to the predicate.
public func || (lhs: NSPredicate, rhs: NSPredicate) -> NSPredicate {
	lhs.or(rhs)
}
