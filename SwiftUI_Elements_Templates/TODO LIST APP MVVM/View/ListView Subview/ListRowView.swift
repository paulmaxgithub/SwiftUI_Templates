//
//  ListRowView.swift
//  SwiftUI_Elements_Templates
//
//  Created by PaulmaX on 13.02.23.
//

import SwiftUI

struct ListRowView: View {
    
    @EnvironmentObject private var viewModel: ListViewModel
    
    var item: ItemModel
    
    var body: some View {
        HStack {
            Image(systemName: item.isCompleted ? "checkmark.circle" : "circle.fill")
                .foregroundColor(item.isCompleted ? .green : .gray)
                .onTapGesture { viewModel.updateItem(item) }
            Text(item.title)
            Spacer()
        }
        .font(.title2)
        .padding(.vertical, 8)
    }
}

#if DEBUG
struct ListRowView_Previews: PreviewProvider {
    
    static var itemInstance_1 = ItemModel(title: "Welcome to the 100 Days of SwiftUI!", isCompleted: false)
    static var itemInstance_2 = ItemModel(title: "Days 1-14: Introduction to Swift", isCompleted: true)
    
    static var previews: some View {
        Group {
            ListRowView(item: itemInstance_1)
            ListRowView(item: itemInstance_2)
        }
        .previewLayout(.sizeThatFits)
    }
}
#endif
