//
//  ScrollView_.swift
//  SwiftUI_Elements_Templates
//
//  Created by PaulmaX on 9.02.23.
//

import SwiftUI

struct ScrollView_: View {
    var body: some View {
        ScrollView {
            LazyVStack {
                ForEach(0..<100) { index in
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            ForEach(0..<10) { index in
                                RoundedRectangle(cornerRadius: 25)
                                    .fill(.white)
                                    .frame(width: 200, height: 150)
                                    .shadow(radius: 10)
                                    .padding()
                            }
                        }
                    }
                }
            }
            .padding(.horizontal)
        }
    }
}

struct ScrollView__Previews: PreviewProvider {
    static var previews: some View {
        ScrollView_()
    }
}
