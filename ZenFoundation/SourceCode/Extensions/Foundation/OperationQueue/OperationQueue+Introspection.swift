import Foundation

public extension OperationQueue {
	
	/// Returns the operations currently executing in the queue.
	var runningOperations: [Operation] {
		operations.filter {
			$0.isExecuting && !$0.isFinished && !$0.isCancelled
		}
	}
	
}
