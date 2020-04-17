import Foundation

public extension Scanner {
	
	/// Returns a Double if scanned in hexadecimal, or `nil` if not found.
	var scanHexDouble: Double? {
		var value: Double = 0
		return scanHexDouble(&value) ? value : nil
	}
	
	/// Returns a Float if scanned in hexadecimal, or `nil` if not found.
	var scanHexFloat: Float? {
		var value: Float = 0
		return scanHexFloat(&value) ? value : nil
	}
	
	/// Returns a UInt32 if scanned in hexadecimal, or `nil` if not found.
	var scanHexInt32: UInt32? {
		var value: UInt32 = 0
		return scanHexInt32(&value) ? value : nil
	}
	
	/// Returns a UInt64 if scanned in hexadecimal, or `nil` if not found.
	var scanHexInt64: UInt64? {
		var value: UInt64 = 0
		return scanHexInt64(&value) ? value : nil
	}
	
}
