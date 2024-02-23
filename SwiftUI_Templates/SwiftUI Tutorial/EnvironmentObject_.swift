//
//  EnvironmentObject_.swift
//  UIElementsProject
//
//  Created by PaulmaX on 2.02.23.
//

import SwiftUI

//MARK: - ViewModel
final class EnvironmentViewModel: ObservableObject {
    
    @Published var dataArray: [String] = []
    
    init() { getData() }
    
    func getData() {
        dataArray.append(contentsOf: ["Apple Watch", "iPhone", "iPad", "MacBook", "Mac Pro"])
    }
}

//MARK: - View
struct EnvironmentObject_: View {
    
    @StateObject private var vm = EnvironmentViewModel()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(vm.dataArray, id: \.self) { item in
                    NavigationLink {
                        DetailView(selectedItem: item)
                    } label: {
                        Text(item)
                    }
                }
            }
            .navigationTitle("Apple Devices")
        }
        .accentColor(.white)
        .environmentObject(vm)
    }
}

struct DetailView: View {
    
    let selectedItem: String
    
    var body: some View {
        ZStack {
            ///BACKGROUND
            Color.orange.ignoresSafeArea()
            
            ///CONTENT
            NavigationLink {
                FinalView()
            } label: {
                Text("\(selectedItem) models")
                    .font(.headline)
                    .foregroundColor(.orange)
                    .padding()
                    .padding(.horizontal)
                    .background(.white)
                    .cornerRadius(30)
            }
        }
    }
}

struct FinalView: View {
    
    @EnvironmentObject var vm: EnvironmentViewModel
    
    var body: some View {
        ZStack {
            ///BACKGROUND
            EllipticalGradient(gradient: Gradient(colors: [.blue, .orange]),
                               center: .center,
                               startRadiusFraction: -0.3,
                               endRadiusFraction: 0.9)
                .ignoresSafeArea()
            
            ///CONTENT
            VStack(spacing: 20.0) {
                ForEach(vm.dataArray, id: \.self) { item in
                    Text(item)
                }
            }
            .foregroundColor(.white)
            .font(.largeTitle)
        }
    }
}

struct EnvironmentObject__Previews: PreviewProvider {
    static var previews: some View {
        EnvironmentObject_()
    }
}
