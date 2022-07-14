import Foundation

public extension CharacterSet {
	
	/// Returns characters representing the given set.
	var characters: [Character] {
		codePoints.compactMap { codePoint in
			UnicodeScalar(codePoint).map {
				Character($0)
			}
		}
	}
	
	/// Returns code points representing the given set.
	var codePoints: [Int] {
		var result: [Int] = []
		var plane: Int = 0
		for (i, w) in bitmapRepresentation.enumerated() {
			let k = i % 0x2001
			if k == 0x2000 {
				// plane index byte
				plane = Int(w) << 13
				continue
			}
			let base = (plane + k) << 3
			for j in 0 ..< 8 where w & 1 << j != 0 {
				result.append(base + j)
			}
		}
		return result
	}
	
}
