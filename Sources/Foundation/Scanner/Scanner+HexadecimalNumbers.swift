import Foundation

public extension Scanner {
	
	/// Returns a Double if scanned in hexadecimal, or `nil` if not found.
	var scanHexDouble: Double? {
		scanDouble(representation: .hexadecimal)
	}
	
	/// Returns a Float if scanned in hexadecimal, or `nil` if not found.
	var scanHexFloat: Float? {
		scanFloat(representation: .hexadecimal)
	}
	
	/// Returns a UInt32 if scanned in hexadecimal, or `nil` if not found.
	var scanHexInt32: UInt32? {
		scanUInt64(representation: .hexadecimal).map {
			UInt32(clamping: $0)
		}
	}
	
	/// Returns a UInt64 if scanned in hexadecimal, or `nil` if not found.
	var scanHexInt64: UInt64? {
		scanUInt64(representation: .hexadecimal)
	}
	
}
