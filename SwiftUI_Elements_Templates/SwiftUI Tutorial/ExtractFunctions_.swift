//
//  ExtractedFucrtions.swift
//  UIElementsProject
//
//  Created by PaulmaX on 28.01.23.
//

import SwiftUI

struct ExtractFunctions_: View {
    
    @State private var backgrndColor: Color = .pink
    
    var body: some View {
        ZStack {
            backgrndColor.ignoresSafeArea() ///BACKGROUND
            content                         ///CONTENT
        }
    }
    
    private var content: some View {
        VStack {
            Text("Title")
                .font(.largeTitle)
            Button  {
                buttonPressed()
            } label: {
                Text("PRE$$$!!!")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.black)
                    .cornerRadius(10)
            }
        }
    }
    
    private func buttonPressed() {
        backgrndColor = .orange
    }
}

#if DEBUG
struct ExtractedFucrtions_Previews: PreviewProvider {
    static var previews: some View {
        ExtractFunctions_()
    }
}
#endif
