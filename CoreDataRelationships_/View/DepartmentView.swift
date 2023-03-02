//
//  DepartmentView.swift
//  CoreDataRelationships_
//
//  Created by PaulmaX on 2.03.23.
//

import SwiftUI

struct DepartmentView: View {
    
    let entity: DepartmentEntity
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            VStack(alignment: .leading) {
                Text("Name: \(entity.name ?? "")").font(.headline)
                Divider()
            }
            if let businesses = entity.businesses?.allObjects as? [BusinessEntity] {
                Text("Businesses: ").bold()
                ForEach(businesses) { Text($0.name ?? "⚠️ Add Business...") }
            }
            if let employees = entity.employees?.allObjects as? [EmployeeEntity] {
                Text("Employees: ").bold()
                ForEach(employees) { Text($0.name ?? "⚠️ Add Employee...") }
            }
        }
        .padding()
        .frame(maxWidth: 300, alignment: .leading)
        .background(Color.green.opacity(0.5).cornerRadius(10).shadow(radius: 10))
    }
}
