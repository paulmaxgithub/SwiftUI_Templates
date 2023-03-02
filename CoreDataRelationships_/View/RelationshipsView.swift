//
//  RelationshipsView.swift
//  CoreDataRelationships_
//
//  Created by PaulmaX on 2.03.23.
//

import SwiftUI

struct RelationshipsView: View {
    
    @StateObject private var vm = RelationshipsViewModel()
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 20) {
                    Button {
                        vm.deleteDepartment()
                    } label: {
                        Text("Perform Action")
                            .foregroundColor(.white)
                            .frame(height: 55)
                            .frame(maxWidth: .infinity)
                            .background(Color.purple.cornerRadius(10))
                    }
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(alignment: .top, spacing: 10) {
                            ForEach(vm.businesses) {
                                BusinessView(entity: $0)
                            }
                        }
                    }
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(alignment: .top, spacing: 10) {
                            ForEach(vm.departments) {
                                DepartmentView(entity: $0)
                            }
                        }
                    }
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(alignment: .top, spacing: 10) {
                            ForEach(vm.employees) {
                                EmployeeView(entity: $0)
                            }
                        }
                    }
                    
                }
                .padding()
            }
            .navigationTitle("Relationships")
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        RelationshipsView()
    }
}
