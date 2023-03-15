//
//  ImageListView.swift
//  SwiftUI_Elements_Templates
//
//  Created by PaulmaX on 14.03.23.
//

import SwiftUI

struct ImageListView: View {
    
    @StateObject var vm = ImageListView_VM()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(vm.photoModelData) { model in
                    ImageRowView(model: model)
                }
            }
            .navigationTitle("Download Images")
        }
        .navigationViewStyle(.stack)
    }
}
