//
//  Stack_.swift
//  SwiftUI_Elements_Templates
//
//  Created by PaulmaX on 9.02.23.
//

import SwiftUI

struct Stack_: View {
    var body: some View {
        
        ZStack {
            Rectangle()
                .fill(.green)
                .frame(width: 350, height: 700)
            VStack(alignment: .center, spacing: 4) {
                Rectangle()
                    .fill(.red)
                    .frame(width: 100, height: 100)
                Rectangle()
                    .fill(.orange)
                    .frame(width: 70, height: 70)
                Rectangle()
                    .fill(.purple)
                    .frame(width: 35, height: 35)
                
                Spacer(minLength: 2)
                    .frame(width: 10, height: 200)
                    .background(.black)
                    .cornerRadius(10)
                    .padding()
                
                HStack(alignment: .lastTextBaseline, spacing: 10) {
                    Circle()
                        .fill(.white)
                        .frame(width: 50, height: 50)
                    Circle()
                        .fill(.brown)
                        .frame(width: 70, height: 70)
                    Circle()
                        .fill(.pink)
                        .frame(width: 60, height: 60)
                }
                .padding()
                .background(.yellow)
                .padding()
            }
        }
    }
}

struct Stack__Previews: PreviewProvider {
    static var previews: some View {
        Stack_()
    }
}
