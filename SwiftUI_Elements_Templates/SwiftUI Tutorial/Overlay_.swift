//
//  Overlay_.swift
//  SwiftUI_Elements_Templates
//
//  Created by PaulmaX on 9.02.23.
//

import SwiftUI

struct Overlay_: View {
    var body: some View {
        VStack {
            //
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                .frame(width: 100, height: 100, alignment: .center)
                .background(
                    //                LinearGradient(gradient: Gradient(colors: [.red, .white]),
                    //                               startPoint: .trailing, endPoint: .leading)
                    
                    Circle().fill(.blue)
                )
                .frame(width: 150, height: 150, alignment: .center)
                .background(
                    Circle().fill(.red)
                )
                .padding()
            
            //
            Circle()
                .fill(.pink)
                .frame(width: 100, height: 100, alignment: .center)
                .overlay(
                    Text("$")
                        .font(.largeTitle)
                        .bold()
                        .foregroundColor(.white)
                    , alignment: .center
                )
                .background(
                    Circle()
                        .fill(.purple)
                        .frame(width: 110, height: 110, alignment: .center)
                )
                .padding()
            
            //
            Rectangle()
                .frame(width: 100, height: 100)
                .overlay(
                    Rectangle()
                        .fill(.red)
                        .frame(width: 50, height: 50)
                    , alignment: .center
                )
                .background(
                    Rectangle()
                        .fill(.yellow)
                        .frame(width: 150, height: 150)
                    , alignment: .center
                )
                .padding(40)
            
            //
            Image(systemName: "heart.fill")
                .foregroundColor(.white)
                .font(.system(size: 40))
                .background(
                    Circle()
                        .fill(
                            LinearGradient(gradient: Gradient(colors: [.orange, .purple]),
                                           startPoint: .top, endPoint: .bottom)
                        )
                        .frame(width: 100, height: 100, alignment: .center)
                        .shadow(color: .gray, radius: 7, x: 5, y: 5)
                        .overlay(
                            Circle()
                                .fill(.purple)
                                .frame(width: 30, height: 30)
                                .overlay(
                                    Text("5")
                                        .font(.headline)
                                        .foregroundColor(.white)
                                )
//                                .shadow(color: .gray, radius: 10, x: 5, y: 5)
                            , alignment: .topTrailing
                        )
                )
                .padding(40)
        }
    }
}

struct Overlay__Previews: PreviewProvider {
    static var previews: some View {
        Overlay_()
    }
}
