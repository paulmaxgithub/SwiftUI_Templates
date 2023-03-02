//
//  RelationshipsViewModel.swift
//  CoreDataRelationships_
//
//  Created by PaulmaX on 2.03.23.
//

import CoreData

final class RelationshipsViewModel: ObservableObject {
    
    @Published public var businesses:   [BusinessEntity] = []
    @Published public var departments:  [DepartmentEntity] = []
    @Published public var employees:  [EmployeeEntity] = []
    
    let persistenceController = RelationshipsPersistenceController.shared
    
    init() {
        getBusinesses()
        getDepartments()
        getEmployees()
    }
    
    public func addBusiness() {
        let newBusiness = BusinessEntity(context: persistenceController.context)
        newBusiness.name = "Amazon"
        
        //add existing departments to the new business
        //.departments = [departments[0], departments[1]] //✅
        
        //add existing employees to the new business
        //newBusiness.employees = [employees[1]] //✅
        
        //add new business to existing department
        //newBusiness.addToDepartments(<#T##value: DepartmentEntity##DepartmentEntity#>)
        
        //add new business to existing employee
        //newBusiness.addToEmployees(<#T##value: EmployeeEntity##EmployeeEntity#>)
        
        save()
    }
    
    public func addDepartment() {
        let newDepartment = DepartmentEntity(context: persistenceController.context)
        newDepartment.name = "ASD"
        //newDepartment.businesses = [businesses[0], businesses[1], businesses[2]]
        //newDepartment.addToEmployees(employees[1])
        save()
    }
    
    public func addEmployee() {
        let newEmployee = EmployeeEntity(context: persistenceController.context)
        newEmployee.name = "John"
        newEmployee.age = 34
        newEmployee.dateJoined = Date()
        newEmployee.business = businesses[2]
        newEmployee.department = departments[1]
        save()
    }
    
    private func save() {
        businesses.removeAll()
        departments.removeAll()
        employees.removeAll()
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) { [unowned self] in
            persistenceController.save()
            getBusinesses()
            getDepartments()
            getEmployees()
        }
    }
    
    public func deleteDepartment() {
        departments
            .filter({ $0.name == "ASD" })
            .forEach({ persistenceController.context.delete($0) })
        save()
    }
    
    private func getBusinesses() {
        let request = NSFetchRequest<BusinessEntity>(entityName: "BusinessEntity")
        request.sortDescriptors = [NSSortDescriptor(keyPath: \BusinessEntity.name, ascending: true)]
        
//        let filter = NSPredicate(format: "name == %@", "Apple")
//        request.predicate = filter
        
        do {
            businesses = try persistenceController.context.fetch(request)
        } catch let error {
            fatalError("Error by fetching Data - \(error.localizedDescription)")
        }
    }
    
    private func getDepartments() {
        let request = NSFetchRequest<DepartmentEntity>(entityName: "DepartmentEntity")
        request.sortDescriptors = [NSSortDescriptor(keyPath: \DepartmentEntity.name, ascending: true)]
        do {
            departments = try persistenceController.context.fetch(request)
        } catch let error {
            fatalError("Error by fetching Data - \(error.localizedDescription)")
        }
    }
    
    private func getEmployees() {
        let request = NSFetchRequest<EmployeeEntity>(entityName: "EmployeeEntity")
        request.sortDescriptors = [NSSortDescriptor(keyPath: \EmployeeEntity.name, ascending: true)]
        do {
            employees = try persistenceController.context.fetch(request)
        } catch let error {
            fatalError("Error by fetching Data - \(error.localizedDescription)")
        }
    }
}
