//
//  Animation_Timing_.swift
//  UIElementsProject
//
//  Created by PaulmaX on 29.01.23.
//

import SwiftUI

struct Animation_Timing_: View {
    
    @State private var isAnimating: Bool = false
    @State private var isZoomed: Bool = false
    
    let timing: Double = 10.0
    
    var body: some View {
        VStack {
            
            ZStack(alignment: .topLeading) {
                Color.orange.ignoresSafeArea() ///BACKGROUNd
                
                ///CONTENT
                Image("wwdc")
                    .resizable()
                    .aspectRatio(contentMode: isZoomed ? .fill : .fit)
                    .onTapGesture { withAnimation(.linear(duration: 1.5)) { isZoomed.toggle() } }
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
            
                    Image(systemName: "video.fill")
                        .font(.title2)
                        .foregroundColor(.white)
                        .padding()
                        .offset(CGSize(width: isZoomed ? -70 : 0, height: 0))
                        .animation(.linear(duration: 1.5), value: isZoomed)
            }
            
            VStack(alignment: .center) {
                
                Button("BUTTON") { isAnimating.toggle() }.buttonStyle(.borderedProminent).padding()
                
                RoundedRectangle(cornerRadius: 20)
                    .frame(width: isAnimating ? 350 : 50, height: 30)
                    .animation(.spring(response: 0.3, dampingFraction: 0.5, blendDuration: 0.9),
                               value: isAnimating)
                
                RoundedRectangle(cornerRadius: 20)
                    .frame(width: isAnimating ? 350 : 50, height: 30)
                    .animation(Animation.easeOut(duration: timing), value: isAnimating)
                
                RoundedRectangle(cornerRadius: 20)
                    .frame(width: isAnimating ? 350 : 50, height: 30)
                    .animation(Animation.easeInOut(duration: timing), value: isAnimating)
            }
            .padding(.horizontal)
        }
    }
}

struct AnimationGTiming_Previews: PreviewProvider {
    static var previews: some View {
        Animation_Timing_()
    }
}
