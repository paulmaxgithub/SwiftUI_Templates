//
//  ObservableObject_.swift
//  UIElementsProject
//
//  Created by PaulmaX on 1.02.23.
//

import SwiftUI

//MARK: - Model
struct FruitModel: Identifiable {
    let id = UUID()
    let name: String
    let count: Int
}

//MARK: - ViewModel
final class FruitViewModel: ObservableObject {
    
    @Published var fruits: [FruitModel] = []
    @Published var isLoading: Bool = false
    
    init() { getFruits() }
    
    //MARK: FUNCTIONS
    public func getFruits() {
        
        isLoading = true
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) { [unowned self] in
            fruits = initFruitsModel()
            isLoading = false
        }
    }
    
    public func deleteFruit(indexSet: IndexSet) {
        fruits.remove(atOffsets: indexSet)
    }
    
    //MARK: MOCK MODEL
    private func initFruitsModel() -> [FruitModel] {
        return [FruitModel(name: "apples", count: 33),
                FruitModel(name: "pineapples", count: 50),
                FruitModel(name: "ananas", count: 5),
                FruitModel(name: "bananas", count: 7),
                FruitModel(name: "peaches", count: 20)]
    }
}

//MARK: - View
struct ObservableObject_: View {
    
    // - @StateObject       -> USE THIS ON CREATION / INIT
    @StateObject var vm = FruitViewModel()
    
    // - @ObservedObject    -> USE THIS FOR SUBVIEWS
    
    var body: some View {
        NavigationView {
            List {
                
                if vm.isLoading {
                    ProgressView()
                } else {
                    //MARK: TABLE
                    ForEach(vm.fruits) { fruit in
                        HStack {
                            Text("\(fruit.count)")
                                .foregroundColor(.red)
                                .bold()
                            Text("\(fruit.name)")
                        }
                    }
                    .onDelete(perform: vm.deleteFruit)
                }
            }
            .navigationTitle("FRUITS")
            .navigationBarItems(
                trailing: NavigationLink(destination: { RandomScreen(viewModel: vm) },
                                         label: { Image(systemName: "arrow.right") }))
            .listStyle(.grouped)
        }
    }
}

struct RandomScreen: View {
    
    @ObservedObject var viewModel: FruitViewModel
    
    var body: some View {
        ZStack {
            ///BACKGROUND
            Color.red.ignoresSafeArea()
            
            ///CONTENT
            VStack {
                ForEach(viewModel.fruits) { fruit in
                    Text(fruit.name)
                        .foregroundColor(.white)
                        .font(.headline)
                }
            }
        }
    }
}

struct ObservableObject_Previews: PreviewProvider {
    static var previews: some View {
        ObservableObject_()
    }
}
