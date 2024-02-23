//
//  TapGesture_.swift
//  UIElementsProject
//
//  Created by PaulmaX on 1.02.23.
//

import SwiftUI

struct TapGesture_: View {
    
    @State private var isSelected: Bool = false
    
    var body: some View {
        VStack(spacing: 40) {
            RoundedRectangle(cornerRadius: 10)
                .frame(height: 200)
                .foregroundColor(isSelected ? .green : .purple)
            Button {
                isSelected.toggle()
            } label: {
                Text("Button")
                    .padding()
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .background(.blue)
                    .cornerRadius(10)
            }
            
            Text("Tap Gesture")
                .font(.headline)
                .foregroundColor(.white)
                .frame(height: 55)
                .frame(maxWidth: .infinity)
                .background(.blue)
                .cornerRadius(10)
                .onTapGesture {
                    isSelected.toggle()
                }
        }
        .padding(.horizontal)
    }
}

struct TapGesture__Previews: PreviewProvider {
    static var previews: some View {
        TapGesture_()
    }
}
