//
//  Sort_Filter_Map_.swift
//  SwiftUI_Elements_Templates
//
//  Created by PaulmaX on 23.02.23.
//

import SwiftUI

enum SortingType {
    case name, point, auth
}

struct UserModel_1: Identifiable {
    let id = UUID().uuidString
    let name: String
    let point: Int
    let isVarified: Bool
}

class ArrayModificationViewModel: ObservableObject {
    
    @Published var usersArray:      [UserModel_1] = []
    
    init() { getUsers() }
    
    public func getUsers() {
        usersArray = [
            UserModel_1(name: "Nick", point: 6, isVarified: true),
            UserModel_1(name: "John", point: 34, isVarified: false),
            UserModel_1(name: "Kris", point: 5, isVarified: false),
            UserModel_1(name: "Alena", point: 6, isVarified: true),
            UserModel_1(name: "Milena", point: 8, isVarified: true),
            UserModel_1(name: "Nona", point: 2, isVarified: false),
            UserModel_1(name: "Adel", point: 7, isVarified: true),
            UserModel_1(name: "Betty", point: 5, isVarified: false),
        ]
    }
    
    public func sortUsersByType(by type: SortingType) {
        switch type {
        case .name:     usersArray = usersArray.sorted { $0.name < $1.name }
        case .point:    usersArray = usersArray.sorted { $0.point < $1.point }
        case .auth:     usersArray = usersArray.sorted { $0.isVarified && !$1.isVarified }
        }
    }
    
    public func filterUsers(by type: SortingType, withChar: String? = nil,
                            point: Int? = nil, varified: Bool? = nil) {
        switch type {
        case .name:     usersArray = usersArray.filter { $0.name.contains(withChar ?? "") }
        case .point:    usersArray = usersArray.filter { $0.point > point ?? 0 }
        case .auth:     usersArray = usersArray.filter { $0.isVarified }
        }
    }
    
    public func mapUsers(by type: SortingType) {
        switch type {
        case .name:     usersMapping(name: " 🚀")
        case .point:    usersMapping(points: 0)
        case .auth:     usersMapping(isAuth: true)
        }
    }
    
    private func usersMapping(name: String? = nil, points: Int? = nil, isAuth: Bool? = nil) {
        _ = usersArray.enumerated().map({ model in
            if model.element.point > 20 {
                usersArray.remove(at: model.offset)
                usersArray.insert(UserModel_1(name: name ?? model.element.name,
                                              point: points ?? model.element.point,
                                              isVarified: isAuth ?? model.element.isVarified),
                                  at: model.offset)}})
    }
}

struct Sort_Filter_Map_: View {
    
    @StateObject private var vm = ArrayModificationViewModel()
    @State private var type: SortingType? = nil
    
    var body: some View {
        VStack {
            ScrollView {
                VStack(spacing: 7) {
                    Divider().overlay(.black)
                    ForEach(vm.usersArray) { user in
                        HStack {
                            VStack(alignment: .leading) {
                                Text("NAME")
                                    .font(.caption2)
                                Spacer()
                                Text(user.name).font(.title3)
                            }
                            
                            Spacer()
                            Divider().overlay(.black)
                            
                            VStack(alignment: .center) {
                                Text("POINTS")
                                    .font(.caption2)
                                Spacer()
                                Text("\(user.point)").font(.title3)
                            }
                            
                            Divider().overlay(.black)
                            
                            VStack(alignment: .trailing) {
                                Text("AUTHORIZED")
                                    .font(.caption2)
                                Spacer()
                                if user.isVarified {
                                    Image(systemName: "flame.fill")
                                        .font(.title3)
                                }
                            }
                        }
                        .padding(.horizontal, 30)
                        
                        Divider().overlay(.black)
                    }
                }
            }
            
            ///BUTTONS
            VStack(spacing: 10) {
                Button { vm.getUsers() } label: {
                    Text("RESET")
                        .foregroundStyle(.white)
                        .frame(height: 30)
                        .frame(maxWidth: .infinity)
                        .background(Color.gray.cornerRadius(7))
                }

                HStack(spacing: 20) {
                    Button("SORT BY NAME") { vm.sortUsersByType(by: .name) }
                    Button("SORT BY POINT") { vm.sortUsersByType(by: .point) }
                    Button("SORT BY AUTH") { vm.sortUsersByType(by: .auth) }
                }.buttonStyle(.borderedProminent)
                
                HStack(spacing: 20) {
                    Button("FILTER names with 'A'") { vm.filterUsers(by: .name, withChar: "A")}
                    Button("FILTER points > 5") { vm.filterUsers(by: .point, point: 5) }
                    Button("FILTER authorized") { vm.filterUsers(by: .auth, varified: true) }
                }.tint(.orange).buttonStyle(.borderedProminent)
                
                HStack(spacing: 20) {
                    Button("MAP BY NAME") { vm.mapUsers(by: .name) }
                    Button("MAP BY POINT") { vm.mapUsers(by: .point) }
                    Button("MAP BY AUTH") { vm.mapUsers(by: .auth) }
                }.tint(.green).buttonStyle(.borderedProminent)
            }
            .font(.callout)
            .frame(maxWidth: .infinity)
            .padding(.horizontal)
        }
    }
}

struct Sort_Filter_Map__Previews: PreviewProvider {
    static var previews: some View {
        Sort_Filter_Map_()
    }
}
