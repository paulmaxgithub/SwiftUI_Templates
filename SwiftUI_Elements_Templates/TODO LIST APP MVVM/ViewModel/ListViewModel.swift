//
//  ListViewModel.swift
//  SwiftUI_Elements_Templates
//
//  Created by PaulmaX on 14.02.23.
//

import Foundation

final class ListViewModel: ObservableObject {
    
    @Published var items: [ItemModel] = [] { didSet { saveItemsState() } }
    
    let itemsKey: String = "items_list"
    
    init() { getItems() }
    
    private func getItems() {
        //MARK: Mock Data
//        items = [
//            ItemModel(title: "Welcome to the 100 Days of SwiftUI!", isCompleted: false),
//            ItemModel(title: "Days 1-14: Introduction to Swift", isCompleted: true),
//            ItemModel(title: "Reach the world's largest Swift community!", isCompleted: false)
//        ]
        
        guard let itemsData = UserDefaults.standard.data(forKey: itemsKey) else { return }
        
        do {
            items = try JSONDecoder().decode([ItemModel].self, from: itemsData)
        } catch (let error) {
            ///here you need to show an alert here
            fatalError("Data was not decoded with error: \(error)")
        }
    }
    
    public func deleteItem(indexSet: IndexSet) {
        items.remove(atOffsets: indexSet)
    }
    
    public func moveItem(indexSet: IndexSet, to: Int) {
        items.move(fromOffsets: indexSet, toOffset: to)
    }
    
    public func addItem(_ title: String) {
        items.append(ItemModel(title: title, isCompleted: false))
    }
    
    public func updateItem(_ item: ItemModel) {
        if let index = items.firstIndex(where: { $0.id == item.id } ) {
            items[index] = item.updateModelCompletion()
        }
    }
    
    public func saveItemsState() {
        let encodedData = try? JSONEncoder().encode(items)
        UserDefaults.standard.set(encodedData, forKey: itemsKey)
    }
}
