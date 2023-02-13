//
//  Transition_.swift
//  UIElementsProject
//
//  Created by PaulmaX on 29.01.23.
//

import SwiftUI

struct Transition_: View {
    
    @State var showView_Slide:      Bool = false
    @State var showView_Scale:      Bool = false
    @State var showView_Asymmetric: Bool = false
    
    var body: some View {
        ZStack(alignment: .bottom) {
            VStack {
                HStack {
                    Button("METHOD 1") { withAnimation(.linear(duration: 0.2)) { showView_Slide.toggle() } }
                    .tint(.green)
                    .buttonStyle(.borderedProminent)
                    
                    Button("METHOD 2") { showView_Scale.toggle() }
                    .tint(.orange)
                    .buttonStyle(.borderedProminent)
                    
                    Button("METHOD 3") { withAnimation(.linear(duration: 0.2)) { showView_Asymmetric.toggle() } }
                    .buttonStyle(.borderedProminent)
                }
                .padding(.top)
                
                Spacer()
            }
            
            //MARK: METHOD 1 - .slide()
            if showView_Slide {
                RoundedRectangle(cornerRadius: 25)
                    .fill(.green)
                    .frame(height: UIScreen.main.bounds.height * 0.5)
                    .transition(.slide)
            }
            
            //MARK:  METHOD 2 - .scale() - without withAnimation({ ... }) in Button Action
            if showView_Scale {
                RoundedRectangle(cornerRadius: 25)
                    .fill(.orange)
                    .frame(height: UIScreen.main.bounds.height * 0.5)
                    .transition(.scale(scale: 0.1).animation(.easeInOut))
            }
            
            //MARK: METHOD 3 - .asymmetric()
            if showView_Asymmetric {
                RoundedRectangle(cornerRadius: 25)
                    .fill(.purple)
                    .frame(height: UIScreen.main.bounds.height * 0.5)
                    .transition(.asymmetric(insertion: .move(edge: .bottom), removal: .opacity))
            }
        }
        .ignoresSafeArea(SafeAreaRegions.all, edges: .bottom)
    }
}

#if DEBUG
struct Transitions_Previews: PreviewProvider { static var previews: some View { Transition_() } }
#endif
