//
//  FruitsContentViewModel.swift
//  CoreData_
//
//  Created by PaulmaX on 1.03.23.
//

import CoreData

final class FruitsContentViewModel: ObservableObject {
    
    @Published public var storedFruits: [Fruit] = []
    @Published public var editedFruit: Fruit?
    
    private let container: NSPersistentContainer
    
    init() {
        container = PersistenceController.shared.container
        fetchFruits()
    }
    
    //MARK: init()
    private func fetchFruits() {
        let request = NSFetchRequest<Fruit>(entityName: "Fruit")
        do {
            storedFruits = try container.viewContext.fetch(request)
        } catch let nsError as NSError {
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
    }
    
    ///ADD or UPDATE ENTITY
    public func storeCurrentEntity(name: String) {
        if name != "" {
            if editedFruit == nil {
                let newFruit = Fruit(context: container.viewContext)
                newFruit.name = name
            } else {
                editedFruit?.name = name
            }
            saveFruit()
            self.editedFruit = nil
        } else {
            ///ALERT USER TO ENTER DATA
        }
    }
    
    ///DELETE ENTITY
    public func deleteItems(offsets: IndexSet) {
        offsets.map { storedFruits[$0] }.forEach(container.viewContext.delete)
            saveFruit()
    }
    
    ///SAVE ENTITY
    private func saveFruit() {
        do {
            try container.viewContext.save()
            fetchFruits()
        } catch let nsError as NSError {
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
    }
}
