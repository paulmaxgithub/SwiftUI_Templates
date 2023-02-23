//
//  MagnificationGesture_.swift
//  SwiftUI_Elements_Templates
//
//  Created by PaulmaX on 16.02.23.
//

import SwiftUI

struct MagnificationGesture_: View {
    
    @State private var currentRectAmount:   CGFloat = 0
    @State private var currentButtonAmount: CGFloat = 0
    @State private var lastAmount:          CGFloat = 0
    
    var body: some View {
        VStack(spacing: 10) {
            
            HStack {
                Image("happy-kid")
                    .resizable().scaledToFit().frame(width: 35, height: 35).clipShape(Circle())
                Text("SwiftUI Thinking")
                Spacer()
                Image(systemName: "ellipsis")
            }
            .padding(.horizontal, 16)
            
            Image("kidsplayplace").resizable().scaledToFill().frame(height: 300).clipped()
                .scaleEffect(1.0 + currentRectAmount)
                .gesture(MagnificationGesture().onChanged({ value in
                    currentRectAmount = value - 1
                }).onEnded({ _ in
                    withAnimation(.spring()) { currentRectAmount = 0 }
                })).zIndex(1)
            
            HStack {
                Image(systemName: "heart")
                Image(systemName: "message")
                Image(systemName: "paperplane")
                Spacer()
            }
            .font(.title3).padding(.horizontal)
            
            Text("Właśnie rozpoczął się kolejny rok.")
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal)
            
            Spacer()
            
            Text("MagnificationGesture")
                .font(.title).padding(40).background(Color.red.cornerRadius(20))
                .scaleEffect(1.0 + currentButtonAmount + lastAmount)
                .gesture(
                    MagnificationGesture()
                        .onChanged({ value in
                            currentButtonAmount = value - 1
                        })
                        .onEnded({ value in
                            lastAmount += currentButtonAmount
                            currentButtonAmount = 0
                        })
                ).padding(.bottom, 40)
        }
    }
}

struct MagnificationGesture_Previews: PreviewProvider {
    static var previews: some View {
        MagnificationGesture_()
    }
}
