import Foundation

public extension FileManager {

	/// Returns device remaining free space (in bytes).
	func deviceRemainingFreeSpace(directory: SearchPathDirectory) -> Int64? {
		guard
			let documentDirectory = NSSearchPathForDirectoriesInDomains(
				directory,
				.userDomainMask,
				true
			).last,
			let systemAttributes = try? attributesOfFileSystem(forPath: documentDirectory),
			let freeSize = systemAttributes[.systemFreeSize] as? NSNumber
		else {
			return nil
		}
		return freeSize.int64Value
	}

	/// Returns a string containing the formatted value of device remaining free space (in bytes).
	func deviceRemainingFreeSpace(directory: SearchPathDirectory) -> String? {
		guard
			let documentDirectory = NSSearchPathForDirectoriesInDomains(
				directory,
				.userDomainMask,
				true
			).last,
			let systemAttributes = try? attributesOfFileSystem(forPath: documentDirectory),
			let freeSize = systemAttributes[.systemFreeSize] as? NSNumber
		else {
			return nil
		}
		return ByteCountFormatter().string(fromByteCount: freeSize.int64Value)
	}

}
