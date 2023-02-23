//
//  RotationGesture_.swift
//  SwiftUI_Elements_Templates
//
//  Created by PaulmaX on 17.02.23.
//

import SwiftUI

struct RotationGesture_: View {
    
    @State private var angle: Angle = Angle(degrees: 0)
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .foregroundColor(.white)
            .font(.largeTitle)
            .fontWeight(.semibold)
            .padding(50)
            .background(Color.orange.cornerRadius(20))
            .rotationEffect(angle)
            .gesture(RotationGesture().onChanged({ angleValue in
                angle = angleValue
            }).onEnded({ _ in
                withAnimation { angle = Angle(degrees: 0) }
            }))
    }
}

struct RotationGesture__Previews: PreviewProvider {
    static var previews: some View {
        RotationGesture_()
    }
}
