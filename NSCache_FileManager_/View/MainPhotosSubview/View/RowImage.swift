//
//  RowImage.swift
//  SwiftUI_Elements_Templates
//
//  Created by PaulmaX on 15.03.23.
//

import SwiftUI

struct RowImage: View {
    
    @StateObject var vm: ImageRow_VM
    
    init(urlString: String, key: String) {
        _vm = StateObject(wrappedValue: ImageRow_VM(url: urlString, key: key))
    }
    
    var body: some View {
        ZStack {
            if vm.isLoading {
                ProgressView()
            }
            else if let image = vm.image {
                Image(uiImage: image)
                    .resizable()
                    .clipShape(Circle())
            }
            else {
                Image(systemName: "network")
                    .resizable()
                    .clipShape(Circle())
            }
        }
    }
}
