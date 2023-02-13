//
//  SystemMaterials_.swift
//  UIElementsProject
//
//  Created by PaulmaX on 6.02.23.
//

import SwiftUI

struct SystemMaterials_: View {
    var body: some View {
        VStack {
            Spacer()
            
            VStack {
                ///INDICATOR 1️⃣
                RoundedRectangle(cornerRadius: 4)
                    .frame(width: 50, height: 4)
                    .padding()
                Spacer()
            }
            .frame(height: 350)
            .frame(maxWidth: .infinity)
            
            ///KEYBOARD AREA VIEW 2️⃣
            ///.background(.ultraThinMaterial)
            .background(Color(.lightGray).opacity(0.4))
            .cornerRadius(10)
        }
        .ignoresSafeArea()
        
        ///IMAGE BACKGROUND 3️⃣
        .background(
            Image("wwdc")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
        )
    }
}

struct SystemMaterials__Previews: PreviewProvider {
    static var previews: some View {
        SystemMaterials_()
    }
}
