import Foundation

public extension FileManager {
	
	/// Returns device remaining disk free space (in bytes).
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
	
	/// Returns a string containing the formatted value of device remaining disk free space (in bytes).
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
	
	/// Creates a directory at the specified URL, if it already exists does nothing.
	func createDirectoryIfNeeeded(_ url: URL) throws {
		var isDirectory: ObjCBool = true
		guard !fileExists(
			atPath: url.path,
			isDirectory: &isDirectory
		) else {
			return
		}
		do {
			try createDirectory(
				at: url,
				withIntermediateDirectories: true
			)
		} catch {
			throw error
		}
	}
	
}
