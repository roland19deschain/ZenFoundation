import Foundation

public extension URL {
	
	/// Returns occupied disk size (in bytes) of a directory including its subfolders or not.
	func directoryOccupiedDiskSize(
		includingSubfolders: Bool = false
	) throws -> Int {
		guard try isDirectory else {
			throw "resource isn't a directory"
		}
		guard try isReachable else {
			throw "resource isn't reachable"
		}
		if includingSubfolders {
			guard let urls = FileManager.default.enumerator(
				at: self,
				includingPropertiesForKeys: nil
			)?.allObjects as? [URL] else {
				throw "file manager / directory contents reading error"
			}
			return try urls.lazy.reduce(0) {
				(try $1.resourceValues(forKeys: [
					.totalFileAllocatedSizeKey
				]).totalFileAllocatedSize ?? 0) + $0
			}
		} else {
			return try FileManager.default.contentsOfDirectory(
				at: self,
				includingPropertiesForKeys: nil
			).lazy.reduce(0) {
				(try $1.resourceValues(forKeys: [
					.totalFileAllocatedSizeKey
				]).totalFileAllocatedSize ?? 0) + $0
			}
		}
	}
	
	/// Returns string witch contains the directory occupied disk size,  including its subfolders or not.
	func directoryOccupiedDiskSize(
		includingSubfolders: Bool = false
	) throws -> String {
		let size: Int = try directoryOccupiedDiskSize(
			includingSubfolders: includingSubfolders
		)
		let byteCountFormatter = ByteCountFormatter()
		byteCountFormatter.countStyle = .file
		guard let byteCount = byteCountFormatter.string(for: size) else {
			throw "bytes formatting error"
		}
		return byteCount
	}
	
}
