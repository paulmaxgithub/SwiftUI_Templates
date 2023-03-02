//
//  Persistence.swift
//  CoreDataRelationships_
//
//  Created by PaulmaX on 2.03.23.
//

import CoreData

struct RelationshipsPersistenceController {
    
    static let shared = RelationshipsPersistenceController()
    
    let container:  NSPersistentContainer
    let context:    NSManagedObjectContext
    
    init() {
        container = NSPersistentContainer(name: "CoreDataRelationships_")
        container.viewContext.automaticallyMergesChangesFromParent = true
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        context = container.viewContext
    }
    
    public func save() {
        do {
            try context.save()
        } catch let error {
            fatalError("Error saving Core Data - \(error)")
        }
    }
}
