//
//  LazyVGrid_.swift
//  SwiftUI_Elements_Templates
//
//  Created by PaulmaX on 9.02.23.
//

import SwiftUI

struct LazyVGrid_: View {
    
    let columns: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
    ]
    
    var body: some View {
        ScrollView {
            
            Rectangle()
                .fill(.orange)
                .frame(height: 400)
            
            LazyVGrid(columns: columns, alignment: .center,
                      spacing: 6, pinnedViews: [.sectionHeaders]) {
                
                Section {
                    ForEach(0..<50) { index in
                        Rectangle()
                            .frame(height: 150)
                    }
                } header: {
                    Text("Section #1")
                        .font(.title)
                        .frame(maxWidth: .infinity)
                        .foregroundColor(.white)
                        .padding()
                        .background(.yellow)
                }
                
                Section {
                    ForEach(0..<50) { index in
                        Rectangle()
                            .frame(height: 150)
                    }
                } header: {
                    Text("Section #2")
                        .font(.title)
                        .frame(maxWidth: .infinity)
                        .foregroundColor(.white)
                        .padding()
                        .background(.green)
                }
            }
        }
    }
}

struct LazyVGrid__Previews: PreviewProvider {
    static var previews: some View {
        LazyVGrid_()
    }
}
