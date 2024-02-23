//
//  LongTapPressGesture_.swift
//  SwiftUI_Elements_Templates
//
//  Created by PaulmaX on 16.02.23.
//

import SwiftUI

struct LongTapPressGesture_: View {
    
    @State private var isCompleted: Bool = false
    @State private var isSuccess: Bool = false
    
    var body: some View {
        VStack {
            Text(isCompleted ? "COMPLETED" : "NOT COMPLETE")
                .padding()
                .padding(.horizontal)
                .frame(width: 200)
                .background(isCompleted ? .green : .gray)
                .cornerRadius(10)
                .padding(.bottom)
                .onLongPressGesture(minimumDuration: 2, maximumDistance: 200) {
                    isCompleted.toggle()
                }
            
            Rectangle()
                .fill(isCompleted ? .pink : .blue)
                .frame(maxWidth: isCompleted ? .infinity : 0)
                .frame(height: 10)
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(.gray.opacity(0.3))
                .cornerRadius(5)
                .padding(.horizontal)
            
            HStack {
                Text("CLICK HERE")
                    .foregroundColor(.white)
                    .padding()
                    .frame(width: 130)
                    .background(.black)
                    .cornerRadius(10)
                    .onLongPressGesture(minimumDuration: 1.0) { isPressing in
                        // start of press -> min duration
                        if isPressing {
                            withAnimation(.easeInOut(duration: 1.0)) { isCompleted = true }
                        } else {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                                if !isSuccess {
                                    withAnimation(.easeInOut(duration: 1.0)) { isCompleted = false }
                                }
                            }
                        }
                    } perform: {
                        // at the min duration
                        withAnimation(.easeIn) { isSuccess = true }
                    }
                
                Text("Reset".uppercased())
                    .foregroundColor(.white)
                    .padding()
                    .frame(width: 130)
                    .background(.black)
                    .cornerRadius(10)
                    .onTapGesture {
                        isCompleted = false
                        isSuccess = false
                    }
            }
        }
    }
}

struct LongTapPressGesture__Previews: PreviewProvider {
    static var previews: some View {
        LongTapPressGesture_()
    }
}
