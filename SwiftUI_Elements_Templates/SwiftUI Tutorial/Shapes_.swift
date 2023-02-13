//
//  Shapes_.swift
//  SwiftUI_Elements_Templates
//
//  Created by PaulmaX on 8.02.23.
//

import SwiftUI

struct Shapes_: View {
    var body: some View {
        
        ZStack {
            
            RoundedRectangle(cornerRadius: 30)
                .fill(.red)
            
            Rectangle()
                .foregroundColor(.yellow)
                .padding()
            
            Capsule(style: .circular)
                .foregroundColor(.gray)
                .padding()
            
            Ellipse()
                .padding()
                .padding()
            
            VStack(spacing: 5) {
                Spacer()
                
                Circle()
                    .foregroundColor(.green)
                    .frame(width: 100, height: 100)
                
                Spacer()
                
                Circle()
                //                .fill(.orange)
                    .stroke(.orange, lineWidth: 10)
                    .frame(width: 100, height: 100)
                
                Spacer()
                
                Circle()
                    .stroke(.purple,
                            style: StrokeStyle(lineWidth: 30,
                                               lineCap: .butt,
                                               lineJoin: .miter,
                                               miterLimit: 5,
                                               dash: [10, 2, 9],
                                               dashPhase: 45))
                    .frame(width: 150, height: 150)
                
                Spacer()
                
                Circle()
                    .trim(from: 0.1, to: 0.9)
                    .stroke(.tint, lineWidth: 30)
                    .frame(width: 100, height: 100, alignment: .center)
                
                Spacer()
            }
        }
    }
}

struct Shapes__Previews: PreviewProvider {
    static var previews: some View {
        Shapes_()
    }
}
