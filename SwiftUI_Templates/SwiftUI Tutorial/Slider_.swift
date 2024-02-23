//
//  Slider_.swift
//  UIElementsProject
//
//  Created by PaulmaX on 31.01.23.
//

import SwiftUI

struct Slider_: View {
    
    @State private var sliderValue: Double = 3
    @State private var isEditing:   Bool = false
    
    var body: some View {
        ZStack {
            
            Color(isEditing ? .orange : .tintColor).ignoresSafeArea()
            
            VStack {
                Text("\(Int(sliderValue))")
                    .font(.largeTitle)
    //            Slider(value: $sliderValue, in: 1...5, step: 1)
                Slider(value: $sliderValue,
                       in: 1...5,
                       step: 0.5,
                       label: { Text("SLIDER") },
                       minimumValueLabel: { Text("1️⃣") },
                       maximumValueLabel: { Text("5️⃣") },
                       onEditingChanged: { isEditing in self.isEditing = isEditing })
                    
                    .accentColor(.black)
                    .padding()
                    .background(.white)
                    .cornerRadius(10)
                    .padding()
            }
        }
    }
}

struct Slider__Previews: PreviewProvider {
    static var previews: some View {
        Slider_()
    }
}
