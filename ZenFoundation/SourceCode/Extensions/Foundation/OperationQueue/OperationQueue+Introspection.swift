import Foundation

public extension OperationQueue {
	
	/// Returns the operations currently executing in the queue.
	var runningOperations: [Operation] {
		operations.filter {
			$0.executing && !$0.finished && !$0.cancelled
		}
	}
	
}
