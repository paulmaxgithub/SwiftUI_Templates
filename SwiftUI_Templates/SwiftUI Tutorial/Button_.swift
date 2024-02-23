//
//  Button_.swift
//  SwiftUI_Elements_Templates
//
//  Created by PaulmaX on 9.02.23.
//

import SwiftUI

struct Button_: View {
    
    @State private var title: String = "..."
    
    var body: some View {
        VStack {
            Text(title)
                .font(.title)
                .padding()
            
            Button {
                title = "First New Message!"
            } label: {
                Text("Button".uppercased())
                    .foregroundColor(.white)
                    .bold()
                    .padding()
                    .padding(.horizontal, 20)
                    .background(Color.orange.cornerRadius(10).shadow(radius: 10))
            }
            .padding()
            
            Button {
                title = "LOVE ❤️ Message!"
            } label: {
                Circle()
                    .fill(.white)
                    .frame(width: 80, height: 80)
                    .shadow(radius: 10)
                    .overlay(Image(systemName: "heart.fill").font(.largeTitle).foregroundColor(.red))
            }
            .padding()
            
            Button {
                title = "FINISH 🏁"
            } label: {
                Text("Finish")
                    .font(.caption)
                    .bold()
                    .foregroundColor(.green)
                    .padding()
                    .padding(.horizontal, 20)
                    .background(Capsule().stroke(Color.gray, lineWidth: 3))
            }
        }
    }
}

struct Button__Previews: PreviewProvider {
    static var previews: some View {
        Button_()
    }
}
