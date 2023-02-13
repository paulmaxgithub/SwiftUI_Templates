//
//  Frame_.swift
//  SwiftUI_Elements_Templates
//
//  Created by PaulmaX on 9.02.23.
//

import SwiftUI

struct Frame_: View {
    var body: some View {
        Text("Hello, World! , World!")
            .background(.white)
            
            .frame(height: 200)
            .background(.green)
            .frame(width: 300, alignment: .leading)
            .background(.red)
            .frame(maxWidth: .infinity)
            .background(.blue)
            .frame(height: 400, alignment: .center)
            .background(.orange)
            .frame(maxHeight: .infinity, alignment: .top)
            .background(.purple)
    }
}

struct Frame__Previews: PreviewProvider {
    static var previews: some View {
        Frame_()
    }
}
