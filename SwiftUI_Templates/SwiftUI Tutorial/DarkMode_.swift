//
//  DarkMode_.swift
//  UIElementsProject
//
//  Created by PaulmaX on 1.02.23.
//

import SwiftUI

struct DarkMode_: View {
    
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 20) {
                    Text("This color is PRIMARY")
                        .foregroundColor(.primary)
                        .padding()
                        .background(.gray)

                    Text("This color is SECONDARY")
                        .foregroundColor(.secondary)
                        .padding()
                        .background(.gray)

                    Text("This color is BLACK")
                        .foregroundColor(.black)
                        .padding()
                        .background(.gray)
                    
                    Text("This color is WHITE")
                        .foregroundColor(.white)
                        .padding()
                        .background(.gray)
                    
                    Text("This color is globally adaptive")
                        .foregroundColor(Color("AdaptiveColor"))
                        .padding()
                        .background(.gray)
                    
                    Text("This color is locally adaptive")
                        .foregroundColor(.black)
                        .padding()
                        .background(colorScheme == .light ? .green : .yellow)
                }
            }
            .navigationTitle("Dark Mode")
        }
    }
}

struct DarkMode__Previews: PreviewProvider {
    static var previews: some View {
        Group {
            DarkMode_()
                .preferredColorScheme(.dark)
            DarkMode_()
                .preferredColorScheme(.light)
        }
    }
}
