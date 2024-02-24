import Foundation

public extension URL {
	
	/// Returns the attributes of the item.
	var attributes: [FileAttributeKey : Any] {
		get throws {
			try FileManager.default.attributesOfItem(atPath: path)
		}
	}

	/// Returns the file’s size of item in bytes.
	var fileSize: UInt64 {
		get throws {
			guard let size = try attributes[.size] as? UInt64 else {
				throw "MappingFailure"
			}
			return size
		}
	}

	/// Returns the file’s size localized description, formatted
	/// with the appropriate byte modifier like KB, MB, GB and so on.
	var fileSizeString: String {
		get throws {
			ByteCountFormatter.string(
				fromByteCount: Int64(try fileSize),
				countStyle: .file
			)
		}
	}
	
	/// Returns the file's creation date.
	var creationDate: Date? {
		get throws {
			guard let date = try attributes[.creationDate] as? Date else {
				throw "MappingFailure"
			}
			return date
		}
	}
	
	/// Returns the file’s last modified date.
	var modificationDate: Date? {
		get throws {
			guard let date = try attributes[.modificationDate] as? Date else {
				throw "MappingFailure"
			}
			return date
		}
	}
	
}
