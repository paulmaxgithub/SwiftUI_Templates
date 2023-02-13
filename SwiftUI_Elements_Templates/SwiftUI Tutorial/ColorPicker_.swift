//
//  ColorPicker_.swift
//  UIElementsProject
//
//  Created by PaulmaX on 31.01.23.
//

import SwiftUI

struct ColorPicker_: View {
    
    @State private var backgroundColor: Color = .orange
    
    var body: some View {
        ZStack {
            ///BACKGROUND
            backgroundColor.ignoresSafeArea()
            
            ///CONTENT
            ColorPicker("Select Color", selection: $backgroundColor, supportsOpacity: true)
                .font(.headline)
                .padding()
                .background(.white)
                .cornerRadius(10)
                .padding()
        }
    }
}

struct ColorPicker__Previews: PreviewProvider {
    static var previews: some View {
        ColorPicker_()
    }
}
