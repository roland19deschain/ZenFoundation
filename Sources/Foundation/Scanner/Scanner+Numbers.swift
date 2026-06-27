import Foundation

public extension Scanner {
	
	/// Returns a Double if scanned, or `nil` if not found.
	var scanDouble: Double? {
		scanDouble()
	}

	/// Returns a Float if scanned, or `nil` if not found.
	var scanFloat: Float? {
		scanFloat()
	}

	/// Returns an Int if scanned, or `nil` if not found.
	var scanInt: Int? {
		scanInt()
	}

	/// Returns an Int32 if scanned, or `nil` if not found.
	var scanInt32: Int32? {
		scanInt32()
	}

	/// Returns an Int64 if scanned, or `nil` if not found.
	var scanInt64: Int64? {
		scanInt64()
	}

	/// Returns a UInt64 if scanned, or `nil` if not found.
	var scanUInt64: UInt64? {
		scanUInt64()
	}

	/// Returns an Decimal if scanned, or `nil` if not found.
	var scanDecimal: Decimal? {
		scanDecimal()
	}
	
}
