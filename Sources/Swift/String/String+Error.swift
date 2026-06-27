import Foundation

extension String: @retroactive Error {}

extension String: @retroactive LocalizedError {
	
	public var errorDescription: String? {
		self
	}
	
}
