// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Item.swift instead.

import CoreData

enum ItemAttributes: String {
    case information = "information"
    case name = "name"
    case recurrence = "recurrence"
}

enum ItemRelationships: String {
    case list = "list"
}

@objc
class _Item: NSManagedObject {

    // MARK: - Class methods

    class func entityName () -> String {
        return "Item"
    }

    class func entity(managedObjectContext: NSManagedObjectContext!) -> NSEntityDescription! {
        return NSEntityDescription.entityForName(self.entityName(), inManagedObjectContext: managedObjectContext);
    }

    // MARK: - Life cycle methods

    override init(entity: NSEntityDescription, insertIntoManagedObjectContext context: NSManagedObjectContext!) {
        super.init(entity: entity, insertIntoManagedObjectContext: context)
    }

    convenience init(managedObjectContext: NSManagedObjectContext!) {
        let entity = _Item.entity(managedObjectContext)
        self.init(entity: entity, insertIntoManagedObjectContext: managedObjectContext)
    }

    // MARK: - Properties

    @NSManaged
    var information: String?

    // func validateInformation(value: AutoreleasingUnsafePointer<AnyObject>, error: NSErrorPointer) {}

    @NSManaged
    var name: String?

    // func validateName(value: AutoreleasingUnsafePointer<AnyObject>, error: NSErrorPointer) {}

    @NSManaged
    var recurrence: NSNumber?

    // func validateRecurrence(value: AutoreleasingUnsafePointer<AnyObject>, error: NSErrorPointer) {}

    // MARK: - Relationships

    @NSManaged
    var list: List?

    // func validateList(value: AutoreleasingUnsafePointer<AnyObject>, error: NSErrorPointer) {}

}

