//
//  Text_.swift
//  SwiftUI_Elements_Templates
//
//  Created by PaulmaX on 8.02.23.
//

import SwiftUI

struct Text_: View {
    var body: some View {
        
        Text("Metal for Machine Learning".uppercased())
//        Text("Core ML 3 has been greatly expanded to enable even more amazing, on-device machine learning capabilities in your app. Learn about the new Create ML..")
        
        //            .font(.largeTitle)
        //            .fontWeight(.medium)
            .font(.system(size: 23, weight: .ultraLight, design: .serif))
        
            .bold()
//            .italic()
            .underline(true, color: .red)
//            .strikethrough(true, color: .white)
        
            .baselineOffset(20)
            .kerning(3)
            .multilineTextAlignment(.leading)
        
            .foregroundColor(.red)
        
            .padding()
            .background(.green)
            .padding(.horizontal)
        ///TEXT SELECTION
            .textSelection(.enabled)
    }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Text_()
    }
}
#endif
