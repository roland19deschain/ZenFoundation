import Foundation

public extension NSPredicate {
	
	/**
	 Returns a predicate that evaluates whether the relationship contains more than 0 entities.
	 - parameter keyPath: The keypath to _to-many_ relationship.
	 */
	static func relationshipNotEmpty(_ keyPath: String) -> NSPredicate {
		relationship(keyPath, countMoreThan: 0)
	}
	
	/**
	 Returns a predicate that evaluates whether the relationship contains more entities than specified count.
	 - parameter keyPath: The keypath to _to-many_ relationship.
	 - parameter count: The number to compare with entities count.
	 */
	static func relationship(
		_ keyPath: String,
		countMoreThan count: Int
	) -> NSPredicate {
		NSPredicate(format: "%K.@count > \(count)", keyPath)
	}
	
	/**
	 Returns a predicate that evaluates whether specified field is equal to given value in all entities in specified relationship.
	 ### Usage example: ###
	 ```
	 let allClientsHasCardPredicate: NSPredicate = .all(
	 entityField: #keyPath(Person.hasCard),
	 equalTo: NSNumber(booleanLiteral: true).stringValue,
	 inRelationship: #keyPath(Bank.clients)
	 )
	 ```
	 - parameter entityFieldKeyPath: The entity field key path.
	 - parameter fieldValue: The value to compare with entity field.
	 - parameter relationshipKeyPath: The relationship to entity (to many) key path.
	 */
	static func all(
		entityField entityFieldKeyPath: String,
		equalTo fieldValue: String,
		inRelationship relationshipKeyPath: String
	) -> NSPredicate {
		NSPredicate(
			format: "SUBQUERY("
			+ "%K, $entity, $entity.%K == %@"
			+ ").@count == %K.@count",
			relationshipKeyPath,
			entityFieldKeyPath,
			fieldValue,
			relationshipKeyPath
		)
	}
	
	/**
	 Returns a predicate that evaluates whether there is at least one entity with field which is equal to given value
	 in specified relationship.
	 ### Usage example: ###
	 ```
	 let atLeastOneJohnPredicate: NSPredicate = .all(
	 entityField: #keyPath(Person.name),
	 equalTo: "John",
	 inRelationship: #keyPath(City.citizens)
	 )
	 ```
	 - parameter entityFieldKeyPath: The entity field key path.
	 - parameter fieldValue: The value to compare with entity field.
	 - parameter relationshipKeyPath: The relationship to entity (to many) key path.
	 */
	static func hasAtLeastOne(
		entityField entityFieldKeyPath: String,
		equalTo fieldValue: String,
		inRelationship relationshipKeyPath: String
	) -> NSPredicate {
		NSPredicate(
			format: "SUBQUERY("
			+ "%K, $entity, $entity.%K == %@"
			+ ").@count > 0",
			relationshipKeyPath,
			entityFieldKeyPath,
			fieldValue
		)
	}
	
}
