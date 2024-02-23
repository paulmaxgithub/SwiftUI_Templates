//
//  Color_.swift
//  SwiftUI_Elements_Templates
//
//  Created by PaulmaX on 8.02.23.
//

import SwiftUI

struct Color_: View {
    var body: some View {
        ZStack {
            
            Color.secondary.ignoresSafeArea()
            
            VStack {
                RoundedRectangle(cornerRadius: 25)
                    .fill(.red)
                .frame(width: 300, height: 200)
                
                RoundedRectangle(cornerRadius: 25)
                    .fill(.primary)
                .frame(width: 300, height: 200)
            }
        }
    }
}

struct Color__Previews: PreviewProvider {
    static var previews: some View {
        Color_()
            .preferredColorScheme(.light)
            
    }
}
