//
//  SafeAria_.swift
//  UIElementsProject
//
//  Created by PaulmaX on 28.01.23.
//

import SwiftUI

struct SafeAria_: View {
    var body: some View {
        
        ZStack {
            
            ///BACKGROUND
            Color.purple.ignoresSafeArea()
            
//            ScrollView {
                
                VStack {
                    
                    Text("Title goes here")
                        .font(.largeTitle)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding()
                    
                    ForEach(0..<3) { index in
                        RoundedRectangle(cornerRadius: 25)
                            .fill(.white)
                            .frame(height: 150)
                            .shadow(radius: 10)
                            .padding(10)
                    }
                }
//            }
//            .background(Color.red.ignoresSafeArea(edges: .top))
        .background(.orange)
        }
    }
}

struct SafeAriaProj_Previews: PreviewProvider {
    static var previews: some View {
        SafeAria_()
    }
}
