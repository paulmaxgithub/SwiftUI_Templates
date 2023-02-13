//
//  WithAnimation_.swift
//  UIElementsProject
//
//  Created by PaulmaX on 29.01.23.
//

import SwiftUI

struct WithAnimation_: View {
    
    @State var isAnimated: Bool = false
    
    var body: some View {
        VStack {
            Button("Button: \(isAnimated.description)".uppercased()) {
                withAnimation(.default) {
                    isAnimated.toggle()
                }
            }
            .padding()
            Spacer()
            RoundedRectangle(cornerRadius: isAnimated ? 50 : 100)
                .fill(isAnimated ? .red : .green)
                .frame(width: isAnimated ? 100 : 300,
                       height: isAnimated ? 100 : 300)
                .offset(y: isAnimated ? 100 : 0)
            Spacer()
        }
    }
}

struct AnimationWithAnimation_Previews: PreviewProvider {
    static var previews: some View {
        WithAnimation_()
    }
}
