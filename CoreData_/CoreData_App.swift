//
//  CoreData_App.swift
//  CoreData_
//
//  Created by PaulmaX on 28.02.23.
//

import SwiftUI

@main
struct CoreData_App: App {
    
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            FruitsContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
