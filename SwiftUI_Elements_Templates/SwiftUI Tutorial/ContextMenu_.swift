//
//  ContextMenu_.swift
//  UIElementsProject
//
//  Created by PaulmaX on 30.01.23.
//

import SwiftUI

struct ContextMenu_: View {
    
    @State var backgroundColor: Color = .green
    
    var body: some View {
        ZStack {
            ///BACKGROUND
            backgroundColor.ignoresSafeArea()
            
            ///CONTENT
            VStack(alignment: .leading, spacing: 20.0) {
                Image(systemName: "house.fill")
                    .font(.title)
                Text("Swiftful Thinking")
                    .font(.headline)
                Text("How to use Context View")
                    .font(.subheadline)
            }
            .foregroundColor(.white)
            .padding()
            .background(Color.red.cornerRadius(10))
            .contextMenu {
                Button {
                    backgroundColor = .yellow
                } label: {
                    Label("Button 1️⃣", systemImage: "flame.fill")
                }
                Button {
                    backgroundColor = .gray
                } label: {
                    Text("Button 2️⃣")
                }
                Button {
                    backgroundColor = .teal
                } label: {
                    HStack {
                        Text("Button 3️⃣")
                        Image(systemName: "heart.fill")
                    }
                }
            }
        }
    }
}

struct ContextMenu__Previews: PreviewProvider {
    static var previews: some View {
        ContextMenu_()
    }
}
