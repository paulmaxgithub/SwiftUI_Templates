//
//  Gradients_.swift
//  SwiftUI_Elements_Templates
//
//  Created by PaulmaX on 9.02.23.
//

import SwiftUI

struct Gradients_: View {
    var body: some View {
        VStack {
            ///LinearGradient
            RoundedRectangle(cornerRadius: 25)
                .fill(
                    LinearGradient(gradient: Gradient(colors: [.orange, .blue, .green, .purple, .yellow]),
                                   startPoint: .topLeading,
                                   endPoint: .bottomTrailing))
                .frame(width: 300, height: 150)
            
            ///RadialGradient
            RoundedRectangle(cornerRadius: 25)
                .fill(
                    RadialGradient(gradient: Gradient(colors: [.blue, .white, .yellow, .orange, .purple]),
                                   center: .center,
                                   startRadius: 3,
                                   endRadius: 170))
                .frame(width: 300, height: 150)
            
            ///
            RoundedRectangle(cornerRadius: 25)
                .fill(
                    AngularGradient(gradient: Gradient(colors: [.yellow, .gray]),
                                    center: .bottomLeading,
                                    angle: .radians(-13.03)))
                .frame(width: 300, height: 150)
        }
    }
}

struct Gradiens_Previews: PreviewProvider {
    static var previews: some View {
        Gradients_()
    }
}
