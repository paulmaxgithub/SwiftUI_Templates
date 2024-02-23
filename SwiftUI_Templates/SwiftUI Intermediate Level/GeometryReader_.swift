//
//  GeometryReader_.swift
//  SwiftUI_Elements_Templates
//
//  Created by PaulmaX on 17.02.23.
//

import SwiftUI

struct GeometryReader_: View {
    var body: some View {
        ZStack {
            GeometryReader { geometry in
                HStack(spacing: 0) {
                    Rectangle()
                        .fill(.orange)
                        .frame(width: geometry.size.width * 0.7)
                    Rectangle().fill(.blue)
                }
                .ignoresSafeArea()
            }
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(0..<20) { index in
                        GeometryReader { geometry in
                            RoundedRectangle(cornerRadius: 20)
                                .fill(.white)
                                .padding()
                                .padding(.vertical, 30)
                                .shadow(radius: 10)
                                .rotation3DEffect(Angle(degrees: getPercentage(geo: geometry) * 30),
                                                  axis: (x: 0, y: -1, z: 0))
                        }
                        .frame(width: 300, height: 250)
                    }
                }
            }
        }
    }
    
    private func getPercentage(geo: GeometryProxy) -> Double {
        let rotationPoint = UIScreen.main.bounds.width / 2
        let midXCurrentItem = geo.frame(in: .global).midX
        return Double(1 - (midXCurrentItem / rotationPoint))
    }
}

struct GeometryReader__Previews: PreviewProvider {
    static var previews: some View {
        GeometryReader_()
            .previewInterfaceOrientation(.portrait)
    }
}
