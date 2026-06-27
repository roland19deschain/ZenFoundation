import Foundation

public extension Decimal {
	
	var doubleValue: Double {
		NSDecimalNumber(decimal: self).doubleValue
	}
	
}
