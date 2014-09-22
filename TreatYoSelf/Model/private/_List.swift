// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to List.swift instead.

import CoreData

enum ListAttributes: String {
    case color = "color"
    case name = "name"
}

enum ListRelationships: String {
    case items = "items"
    case user = "user"
}

@objc
class _List: NSManagedObject {

    // MARK: - Class methods

    class func entityName () -> String {
        return "List"
    }

    class func entity(managedObjectContext: NSManagedObjectContext!) -> NSEntityDescription! {
        return NSEntityDescription.entityForName(self.entityName(), inManagedObjectContext: managedObjectContext);
    }

    // MARK: - Life cycle methods

    override init(entity: NSEntityDescription, insertIntoManagedObjectContext context: NSManagedObjectContext!) {
        super.init(entity: entity, insertIntoManagedObjectContext: context)
    }

    convenience init(managedObjectContext: NSManagedObjectContext!) {
        let entity = _List.entity(managedObjectContext)
        self.init(entity: entity, insertIntoManagedObjectContext: managedObjectContext)
    }

    // MARK: - Properties

    @NSManaged
    var color: String?

    // func validateColor(value: AutoreleasingUnsafePointer<AnyObject>, error: NSErrorPointer) {}

    @NSManaged
    var name: String?

    // func validateName(value: AutoreleasingUnsafePointer<AnyObject>, error: NSErrorPointer) {}

    // MARK: - Relationships

    @NSManaged
    var items: Item?

    // func validateItems(value: AutoreleasingUnsafePointer<AnyObject>, error: NSErrorPointer) {}

    @NSManaged
    var user: User?

    // func validateUser(value: AutoreleasingUnsafePointer<AnyObject>, error: NSErrorPointer) {}

}

