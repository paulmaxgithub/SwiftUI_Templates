//
//  List_.swift
//  UIElementsProject
//
//  Created by PaulmaX on 30.01.23.
//

import SwiftUI

struct List_: View {
    
    @State private var fruits: [String] = ["apples 🍎", "oranges 🍊", "bananas 🍌", "peaches 🍑"]
    @State private var veggies: [String] = ["tomato 🍅", "potato 🥔", "garlic 🧄", "carrot 🥕"]
    
    var body: some View {
        
        NavigationView {
            List {
                Section {
                    ForEach(fruits, id: \.self) { Text($0) }
                    .onDelete(perform: deleteFruits)
                    .onMove(perform: moveFruits)
                } header: {
                    HStack {
                        Text("FRUITS")
                        Image(systemName: "lightbulb.fill")
                    }
                    .font(.headline)
                    .foregroundColor(.orange)
                }
                .listRowBackground(Color.teal)
                .padding(.horizontal)
                
                Section {
                    ForEach(veggies, id: \.self) {
                        Text($0.capitalized)
                            .padding()
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .foregroundColor(.white)
                            .background(.green)
                            .cornerRadius(7)
                    }
                    .onDelete(perform: deleteVeggies)
                    .onMove(perform: moveVeggies)
                } header: {
                    Text("VEGGIES")
                        .foregroundColor(.green)
                        .font(.headline)
                        .underline()
                }
            }
//            .listStyle(InsetListStyle())
            .navigationTitle("Grocery List")
            .navigationBarItems(leading: EditButton(), trailing: addButton)
        }
        .tint(.red)
    }
    
    ///DELETE
    private func deleteFruits(indexSet: IndexSet) {
        fruits.remove(atOffsets: indexSet)
    }
    private func deleteVeggies(indexSet: IndexSet) {
        veggies.remove(atOffsets: indexSet)
    }
    
    ///MOVE
    private func moveFruits(indices: IndexSet, newOffSet: Int) {
        fruits.move(fromOffsets: indices, toOffset: newOffSet)
    }
    
    private func moveVeggies(indices: IndexSet, newOffSet: Int) {
        veggies.move(fromOffsets: indices, toOffset: newOffSet)
    }
    
    ///ADD
    private func addFruit() { fruits.append("Coconut 🍍") }
    private func addVeggie() { veggies.append("Broccoli 🥦") }
    
    //UI Elements
    private var addButton: some View {
        Button("+ ADD", action: { addFruit(); addVeggie() })
    }
}

struct List_Previews: PreviewProvider {
    static var previews: some View {
        List_()
    }
}
