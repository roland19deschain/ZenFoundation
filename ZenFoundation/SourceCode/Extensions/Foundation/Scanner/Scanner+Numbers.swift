import Foundation

public extension Scanner {
	
	/// Returns a Double if scanned, or `nil` if not found.
	var scanDouble: Double? {
		var value: Double = 0
		return scanDouble(&value) ? value : nil
	}
	
	/// Returns a Float if scanned, or `nil` if not found.
	var scanFloat: Float? {
		var value: Float = 0
		return scanFloat(&value) ? value : nil
	}
	
	/// Returns an Int if scanned, or `nil` if not found.
	var scanInt: Int? {
		var value: Int = 0
		return scanInt(&value) ? value : nil
	}
	
	/// Returns an Int32 if scanned, or `nil` if not found.
	var scanInt32: Int32? {
		var value: Int32 = 0
		return scanInt32(&value) ? value : nil
	}
	
	/// Returns an Int64 if scanned, or `nil` if not found.
	var scanInt64: Int64? {
		var value: Int64 = 0
		return scanInt64(&value) ? value : nil
	}
	
	/// Returns a UInt64 if scanned, or `nil` if not found.
	var scanUnsignedInt64: UInt64? {
		var value: UInt64 = 0
		return scanUnsignedLongLong(&value) ? value : nil
	}
	
	/// Returns an Decimal if scanned, or `nil` if not found.
	var scanDecimal: Decimal? {
		var value = Decimal()
		return scanDecimal(&value) ? value : nil
	}
	
}
