//
//  Sheet_Transition_Animation_.swift
//  UIElementsProject
//
//  Created by PaulmaX on 29.01.23.
//

import SwiftUI

struct Sheet_Transition_Animation_: View {
    
    @State var showSheet:       Bool = false
    @State var showTransition:  Bool = false
    @State var showFullScreen:  Bool = false
    
    @State var asd: Int = 1
    
    var body: some View {
        ZStack {
            Color.orange.ignoresSafeArea()
            
            VStack {
                HStack {
                    Button("METHOD 1") { showSheet.toggle() }
                    .font(.headline)
                    .buttonStyle(.borderedProminent)
                    
                    Button("METHOD 2") { withAnimation { showTransition.toggle() } }
                    .font(.headline)
                    .buttonStyle(.borderedProminent)
                    
                    Button("METHOD 3") { showFullScreen.toggle() }
                    .font(.headline)
                    .buttonStyle(.borderedProminent)
                }
                .padding(.top)
                
                Spacer()
            }
            //MARK: - METHOD 1
            .sheet(isPresented: $showSheet) { NewScreen(isPresented: $showSheet) }
            
            //MARK: - METHOD 2 - works on Simulator, NOT on Canvas, works only withAnimation()
            ZStack {
                if showTransition {
                    NewScreen(isPresented: $showTransition)
                        .transition(.move(edge: .leading))
                }
            }
//            .zIndex(2)
            
            //MARK: - METHOD 3
            NewScreen(isPresented: $showFullScreen)
                .offset(y: showFullScreen ? 0 : UIScreen.main.bounds.height)
                .animation(.spring(), value: showFullScreen)
        }
    }
}

struct NewScreen: View {
    
//    @Environment(\.dismiss) var dismiss
    
    @Binding var isPresented: Bool
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            Color.purple.ignoresSafeArea()
            
            Button {
//                dismiss()
                isPresented.toggle()
            } label: {
                Image(systemName: "xmark")
                    .foregroundColor(.white)
                    .font(.title)
            }
            .padding(20)
        }
    }
}

struct sheetVStransitionVSanimation_Previews: PreviewProvider {
    static var previews: some View {
        Sheet_Transition_Animation_()
    }
}
