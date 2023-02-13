//
//  Badges_.swift
//  UIElementsProject
//
//  Created by PaulmaX on 6.02.23.
//

import SwiftUI

struct Badges_: View {
    var body: some View {
        VStack {
            Spacer()
            TabView {
                Color.red
                    .tabItem {
                        Image(systemName: "house.fill")
                        Text("Hello")
                    }
                ///BADGE 🔴
                    .badge(2)
                
                Color.green
                    .tabItem {
                        Image(systemName: "lightbulb.fill")
                        Text("Hello")
                    }
                ///BADGE 🔴
                    .badge(Text("NEW"))
                
                Color.orange
                    .tabItem {
                        Image(systemName: "house.fill")
                        Text("Hello")
                    }
            }
            .frame(height: 300)
            
            List {
                Text("Hello World!")
                ///BADGE 🔴
                    .badge(Text("NEW❗️")
                            .foregroundColor(.red)
                            .bold())
                    .padding()
                Text("Hello Company!")
                Text("Hello Mister President!")
            }
            .listStyle(.insetGrouped)
        }
    }
}

struct Badges__Previews: PreviewProvider {
    static var previews: some View {
        Badges_()
    }
}
