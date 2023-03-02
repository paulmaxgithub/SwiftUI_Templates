//
//  EmployeeView.swift
//  CoreDataRelationships_
//
//  Created by PaulmaX on 2.03.23.
//

import SwiftUI

struct EmployeeView: View {
    
    let entity: EmployeeEntity
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            VStack(alignment: .leading) {
                Text("Employee: \(entity.name ?? "")").font(.headline)
                Text("Age: \(entity.age)").font(.headline)
                Text("Joined Date: \(entity.dateJoined?.formatted(date: .numeric, time: .omitted) ?? "⚠️ Add Date of Join...")").font(.headline)
                Divider()
            }
            
            Text("Business: ").bold()
            Text(entity.business?.name ?? "⚠️ Add Business...")
            
            Text("Department: ").bold()
            Text(entity.department?.name ?? "⚠️ Add Department...")
        }
        .padding()
        .frame(maxWidth: 300, alignment: .leading)
        .background(Color.orange.opacity(0.5).cornerRadius(10).shadow(radius: 10))
    }
}
