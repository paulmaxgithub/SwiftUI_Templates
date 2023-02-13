//
//  SwipeActions_.swift
//  UIElementsProject
//
//  Created by PaulmaX on 6.02.23.
//

import SwiftUI

struct SwipeActions_: View {
    
    @State private var fruits: [String] = [
        "apples 🍎", "oranges 🍊", "bananas 🍌", "peaches 🍑"]
    
    var body: some View {
        List {
            ForEach(fruits, id: \.self) {
                Text($0.capitalized)
                ///RIGHT SIDE
                    .swipeActions(edge: .trailing, allowsFullSwipe: false) {
                        Button("Atchive") { }.tint(.gray)
                        
                        Button("Save") { }.tint(.green)
                        
                        Button("Delete") { }.tint(.red)
                    }
                ///LEFT SIDE
                    .swipeActions(edge: .leading, allowsFullSwipe: false) {
                        Button("Edit") { }.tint(.orange)
                    }
            }
            //.onDelete(perform: delete)
        }
    }
    
    private func delete(indexSet: IndexSet) {
        fruits.remove(atOffsets: indexSet)
    }
}

struct SwipeActions__Previews: PreviewProvider {
    static var previews: some View {
        SwipeActions_()
    }
}
