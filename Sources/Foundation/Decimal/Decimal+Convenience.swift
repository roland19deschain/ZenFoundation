import Foundation

public extension Decimal {
	
	/// Returns the value of the decimal as a `Double`, with possible loss of precision.
	var doubleValue: Double {
		NSDecimalNumber(decimal: self).doubleValue
	}
	
}
