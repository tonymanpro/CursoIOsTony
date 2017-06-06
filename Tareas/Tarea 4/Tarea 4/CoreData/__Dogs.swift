// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Dogs.swift instead.

import Foundation
import CoreData

public enum DogsAttributes: String {
    case dogColor = "dogColor"
    case dogName = "dogName"
    case imageName = "imageName"
}

open class _Dogs: NSManagedObject {

    // MARK: - Class methods

    open class func entityName () -> String {
        return "Dogs"
    }

    open class func entity(managedObjectContext: NSManagedObjectContext) -> NSEntityDescription? {
        return NSEntityDescription.entity(forEntityName: self.entityName(), in: managedObjectContext)
    }

    // MARK: - Life cycle methods

    public override init(entity: NSEntityDescription, insertInto context: NSManagedObjectContext?) {
        super.init(entity: entity, insertInto: context)
    }

    public convenience init?(managedObjectContext: NSManagedObjectContext) {
        guard let entity = _Dogs.entity(managedObjectContext: managedObjectContext) else { return nil }
        self.init(entity: entity, insertInto: managedObjectContext)
    }

    // MARK: - Properties

    @NSManaged open
    var dogColor: String?

    @NSManaged open
    var dogName: String?

    @NSManaged open
    var imageName: String?

    // MARK: - Relationships

}

