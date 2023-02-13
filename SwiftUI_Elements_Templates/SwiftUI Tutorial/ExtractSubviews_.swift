//
//  ExtractSubviews_.swift
//  UIElementsProject
//
//  Created by PaulmaX on 28.01.23.
//

import SwiftUI

struct ExtractSubviews_: View {
    
    var body: some View {
        ZStack {
            Color.gray.ignoresSafeArea()    ///BACKGROUND
            ExtractedView()                 ///CONTENT
        }
    }
}

#if DEBUG
struct ExtractSubviews_Previews: PreviewProvider {
    static var previews: some View {
        ExtractSubviews_()
    }
}
#endif

//MARK: - Extracted Subviews
struct ExtractedView: View {
    var body: some View {
        HStack(alignment: .center, spacing: 3) {
            VStackItem(title: "Apples", county: 3, color: .green)
            VStackItem(title: "Oranges", county: 5, color: .orange)
            VStackItem(title: "Bananes", county: 7, color: .yellow)
        }
    }
}

struct VStackItem: View {
    
    let title: String
    let county: Int
    let color: Color
    
    var body: some View {
        VStack {
            Text("\(county)")
            Text(title)
        }
        .padding()
        .background(color)
        .cornerRadius(10, antialiased: true)
    }
}
