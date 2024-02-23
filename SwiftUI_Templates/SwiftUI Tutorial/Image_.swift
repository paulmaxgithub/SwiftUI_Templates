//
//  Image_.swift
//  SwiftUI_Elements_Templates
//
//  Created by PaulmaX on 9.02.23.
//

import SwiftUI

struct Image_: View {
    var body: some View {
        VStack {
            Image("wwdc")
                .resizable()
                .scaledToFill()
                .frame(width: 300, height: 200)
            //            .cornerRadius(150)
                .clipShape(
                    //                Circle()
                    Capsule(style: .continuous))
            //            .clipped()
            //            .ignoresSafeArea()
            
            Image("G_png") //needed PNG file!!!
                .renderingMode(.template)
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 300)
                .foregroundColor(.orange)
        }
        
    }
}

struct Image__Previews: PreviewProvider {
    static var previews: some View {
        Image_()
    }
}
