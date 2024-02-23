//
//  ListView.swift
//  SwiftUI_Elements_Templates
//
//  Created by PaulmaX on 13.02.23.
//

import SwiftUI

struct ListView: View {
    
    @EnvironmentObject private var viewModel: ListViewModel
    
    var body: some View {
        ZStack {
            if viewModel.items.isEmpty {
                NoItemsView()
                    .transition(.opacity.animation(.easeInOut))
            } else {
                List {
                    ForEach(viewModel.items) { item in
                        ListRowView(item: item)
                    }
                    .onDelete(perform: viewModel.deleteItem)
                    .onMove(perform: viewModel.moveItem)
                }
                .listStyle(.plain)
            }
        }
        .navigationTitle("TODO LIST 📝")
        .navigationBarItems(
            leading: HStack {
                if !(viewModel.items.isEmpty) {
                    EditButton() } },
            trailing: HStack {
                if !(viewModel.items.isEmpty) {
                    NavigationLink("+ ADD", destination: AddView())
                }
            })
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ListView()
        }
        .preferredColorScheme(.light)
        .environmentObject(ListViewModel())
    }
}
