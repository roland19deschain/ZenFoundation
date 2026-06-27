import Foundation

public extension Decimal {
	
	/// Returns the value of the decimal as a `Double`, with possible loss of precision.
	var doubleValue: Double {
		NSDecimalNumber(decimal: self).doubleValue
	}

	/// Returns the value of the decimal as an `Int`, truncating the fractional part.
	var intValue: Int {
		NSDecimalNumber(decimal: self).intValue
	}

	/// Returns the locale-independent string representation of the decimal.
	var stringValue: String {
		NSDecimalNumber(decimal: self).stringValue
	}

	/// Returns `true` when the value is exactly zero.
	var isZero: Bool {
		self == .zero
	}

	/// Returns `true` when the value is less than zero.
	var isNegative: Bool {
		self < .zero
	}

	/// Returns the value rounded to `scale` fractional digits using the given rounding mode.
	func rounded(_ scale: Int = 0, mode: RoundingMode = .plain) -> Decimal {
		var result = Decimal()
		var value = self
		NSDecimalRound(&result, &value, scale, mode)
		return result
	}

}
