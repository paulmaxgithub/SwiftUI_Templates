//
//  FruitsContentView.swift
//  CoreData_
//
//  Created by PaulmaX on 28.02.23.
//

import SwiftUI
import CoreData

fileprivate enum ButtonState {
    case add, edit
}

struct FruitsContentView: View {
    
    @State private var textFieldText:   String = ""
    @State private var buttonState:     ButtonState = .add
    
    @FocusState private var nameIsFocused: Bool
    
    @StateObject private var vm = FruitsContentViewModel()
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                TextField("Add fruit here...", text: $textFieldText)
                    .padding(.horizontal)
                    .textFieldStyle(.roundedBorder)
                    .focused($nameIsFocused)
                
                Button {
                    withAnimation {
                        vm.storeCurrentEntity(name: textFieldText)
                        nameIsFocused.toggle()
                        textFieldText = ""
                        buttonState = .add
                    }
                } label: {
                    Text(buttonState == .add ? "ADD" : "EDIT")
                        .foregroundColor(.white)
                        .font(.headline)
                        .frame(maxWidth: .infinity)
                        .frame(height: 55)
                        .background(Color.purple.cornerRadius(10))
                        .padding(.horizontal)
                }
                
                List {
                    ForEach(vm.storedFruits) { fruit in
                        Text(fruit.name ?? "")
                            .onTapGesture {
                                withAnimation {
                                    vm.editedFruit = fruit
                                    textFieldText = fruit.name ?? ""
                                    nameIsFocused.toggle()
                                    buttonState = .edit
                                }
                            }
                    }
                    .onDelete(perform: withAnimation { vm.deleteItems })
                }
            }
            .navigationTitle("Fruits".uppercased())
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        FruitsContentView()
            .environment(\.managedObjectContext,
                          PersistenceController.shared.container.viewContext)
    }
}
