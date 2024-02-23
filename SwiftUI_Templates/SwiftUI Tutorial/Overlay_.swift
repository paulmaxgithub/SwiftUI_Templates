//
//  Overlay_.swift
//  SwiftUI_Elements_Templates
//
//  Created by PaulmaX on 9.02.23.
//

import SwiftUI

struct Overlay_: View {
    var body: some View {
        VStack(spacing: 40) {
            //
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                .font(.callout)
                .frame(width: 90, height: 90, alignment: .center)
                .background(
                    //LinearGradient(gradient: Gradient(colors: [.red, .white]),
                    //startPoint: .trailing, endPoint: .leading)
                    Circle().fill(.blue)
                )
                .frame(width: 120, height: 120, alignment: .center)
                .background(
                    Circle().fill(.red)
                )
            
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
            
            //
            Rectangle()
                .frame(width: 80, height: 80)
                .overlay(
                    Rectangle()
                        .fill(.red)
                        .frame(width: 30, height: 30)
                    , alignment: .center
                )
                .background(
                    Rectangle()
                        .fill(.yellow)
                        .frame(width: 120, height: 120)
                    , alignment: .center
                )
            
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
                            //.shadow(color: .gray, radius: 10, x: 5, y: 5)
                            , alignment: .topTrailing
                        )
                )
                .padding()
            
            //
            Circle()
                .frame(width: 30, height: 30, alignment: .center)
                .padding()
                .overlay(
                    ZStack {
                        RoundedRectangle(cornerRadius: 20) // shadow layer
                            .shadow(color: Color.blue.opacity(1), radius: 3, x: 3, y: 3)
                        RoundedRectangle(cornerRadius: 20) // mask layer
                            .blendMode(.destinationOut)
                        RoundedRectangle(cornerRadius: 20) // stroke layer
                            .strokeBorder(Color.primary, lineWidth: 2)
                    }
                        .compositingGroup()
                )
        }
    }
}

struct Overlay__Previews: PreviewProvider {
    static var previews: some View {
        Overlay_()
    }
}
