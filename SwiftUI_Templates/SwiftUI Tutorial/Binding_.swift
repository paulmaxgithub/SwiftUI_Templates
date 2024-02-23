//
//  Binding_.swift
//  UIElementsProject
//
//  Created by PaulmaX on 29.01.23.
//

import SwiftUI

struct Binding_: View {
    
    @State private var backgroundColor: Color = Color(uiColor: .secondaryLabel)
    @State private var title: String = "NONE TITLE"
    
    var body: some View {
        ZStack {
            backgroundColor.ignoresSafeArea()   ///BACKGROUND
            
            VStack {                            ///CONTENT
                Text(title).foregroundColor(.white).font(.largeTitle).bold()
                Button_One_View(backgroundColor: $backgroundColor, title: $title)
                Button_Two_View(backgroundColor: $backgroundColor, title: $title)
            }
        }
    }
}

#if DEBUG
struct Binding_Camp_Previews: PreviewProvider { static var previews: some View { Binding_() } }
#endif

struct Button_One_View: View {
    
    @Binding var backgroundColor: Color
    @Binding var title: String
    
    var body: some View {
        Button {
            backgroundColor = .orange
            title = "Button 1️⃣ pressed!"
        } label: {
            Text("Button #1")
                .foregroundColor(.white)
                .padding()
                .padding(.horizontal)
                .background(.blue)
                .cornerRadius(10)
        }
    }
}

struct Button_Two_View: View {
    
    @Binding var backgroundColor: Color
    @Binding var title: String
    
    @State private var buttonColor = Color.blue
    
    var body: some View {
        Button {
            backgroundColor = .teal
            buttonColor = .pink
            title = "Button 2️⃣ pressed!"
        } label: {
            Text("Button #2")
                .foregroundColor(.white)
                .padding()
                .padding(.horizontal)
                .background(buttonColor)
                .cornerRadius(10)
        }
    }
}
