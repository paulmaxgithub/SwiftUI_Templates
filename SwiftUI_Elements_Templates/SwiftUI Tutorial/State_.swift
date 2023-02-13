//
//  State_.swift
//  UIElementsProject
//
//  Created by PaulmaX on 28.01.23.
//

import SwiftUI

struct State_: View {
    
    @State private var backgroundColor: Color = Color.green
    @State private var myTitle: String = "My Title"
    @State private var count: Int = 0
    
    var body: some View {
        ZStack {
            backgroundColor
                .ignoresSafeArea()
            
            VStack(alignment: .center, spacing: 20) {
                Text(myTitle)
                    .font(.largeTitle)
                Text("COUNT: \(count)")
                    .font(.title)
                    .underline()
                
                HStack(spacing: 20) {
                    Button("Button 1️⃣") {
                        backgroundColor = .teal
                        myTitle = "Button 1️⃣ / Count (+ 1)"
                        count += 1
                    }
                    .padding(7)
                    .background(Capsule().stroke(lineWidth: 2).shadow(color: .white, radius: 7, x: 0, y: 0))
                    
                    Button("Button 2️⃣") {
                        backgroundColor = .indigo
                        myTitle = "Button 2️⃣ / Count (- 1)"
                        count -= 1
                    }
                    .padding(7)
                    .background(Capsule().stroke(lineWidth: 2).shadow(color: .white, radius: 7, x: 0, y: 0))
                }
                .padding()
            }
            .foregroundColor(.white)
        }
    }
}

struct StateProject_Previews: PreviewProvider {
    static var previews: some View {
        State_()
    }
}
