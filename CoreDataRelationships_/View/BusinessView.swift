//
//  BusinessView.swift
//  CoreDataRelationships_
//
//  Created by PaulmaX on 2.03.23.
//

import SwiftUI

struct BusinessView: View {
    
    let entity: BusinessEntity
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            VStack(alignment: .leading) {
                Text("Name: \(entity.name?.uppercased() ?? "")").font(.headline)
                Divider()
            }
            if let departments = entity.departments?.allObjects as? [DepartmentEntity] {
                Text("Departments: ").bold()
                ForEach(departments) { Text($0.name ?? "⚠️ Add Department...") }
            }
            if let employees = entity.employees?.allObjects as? [EmployeeEntity] {
                Text("Employees: ").bold()
                ForEach(employees) { Text($0.name ?? "⚠️ Add Employee...") }
            }
        }
        .padding()
        .frame(maxWidth: 300, alignment: .leading)
        .background(Color.gray.opacity(0.5).cornerRadius(10).shadow(radius: 10))
    }
}
