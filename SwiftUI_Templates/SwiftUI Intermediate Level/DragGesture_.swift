//
//  DragGesture_.swift
//  SwiftUI_Elements_Templates
//
//  Created by PaulmaX on 17.02.23.
//

import SwiftUI

struct DragGesture_: View {
    
    @State private var offset: CGSize = .zero
    
    var body: some View {
        ZStack {
            
            VStack {
                Text("\(offset.width)")
                Spacer()
            }
            
            RoundedRectangle(cornerRadius: 20)
                .fill(.orange)
                .frame(width: 300, height: 500)
                .offset(offset)
                .scaleEffect(getScaledAmount())
                .rotationEffect(Angle(degrees: getRotationAmount()))
                .gesture(DragGesture().onChanged({ value in
                    withAnimation(.spring()) { offset = value.translation }
                }).onEnded({ _ in
                    withAnimation { offset = .zero }
                }))
        }
    }
    
    private func getScaledAmount() -> CGFloat {
        let max = UIScreen.main.bounds.width / 2
        let currentAmount = abs(offset.width)
        let percentage = currentAmount / max
        return 1.0 - min(percentage, 0.5) * 0.5
    }
    
    private func getRotationAmount() -> Double {
        let max = UIScreen.main.bounds.width / 2
        let currentAmount = offset.width
        let percentage = currentAmount / max
        let maxAngle: Double = 10
        return Double(percentage) * maxAngle
    }
}

struct SwipeGesture: View {
    
    @Environment(\.scenePhase) var scenePhase
    
    @State private var startingOffset_Y: CGFloat = UIScreen.main.bounds.height * 0.85
    @State private var currentDragOffset_Y: CGFloat = 0
    @State private var endingOffset_Y: CGFloat = 0
    
    var body: some View {
        ZStack {
            ///BACKGROUP
            Color.green.ignoresSafeArea()
            
            ///CONTENT
            SignUpView()
                .offset(y: startingOffset_Y)
                .offset(y: currentDragOffset_Y)
                .offset(y: endingOffset_Y)
                .gesture(DragGesture().onChanged({ value in
                    withAnimation(.spring()) { currentDragOffset_Y = value.translation.height }
                }).onEnded({ _ in
                    withAnimation(.spring()) {
                        if currentDragOffset_Y < -70 {
                            endingOffset_Y = -startingOffset_Y
                        } else if currentDragOffset_Y > 70 && endingOffset_Y != 0 {
                            endingOffset_Y = 0
                        }
                        currentDragOffset_Y = 0
                    }
                }))
            
            VStack {
                Group {
                    Text("Current_Drag_Offset_Y - \(currentDragOffset_Y)")
                    Text("Starting_Offset_Y     - \(startingOffset_Y)")
                    Text("Ending_Offset_Y       - \(endingOffset_Y)")
                }.frame(maxWidth: .infinity).background(.yellow).opacity(0.9)
                
                Spacer()
            }
        }
        .onChange(of: scenePhase) { newPhase in
            withAnimation(.spring()) {
                switch newPhase {
                case .background, .inactive:
                    currentDragOffset_Y = 0
                default: return
                }
            }
        }
    }
}

struct SignUpView: View {
    var body: some View {
        VStack {
            Image(systemName: "chevron.up")
                .padding(.top)
            Text("Sign Up")
                .font(.headline)
                .fontWeight(.semibold)
                .padding()
            Image(systemName: "flame.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
                .padding(.top)
            
            Text("Arguably the most important of the gestures, the Drag Gesture allows us to easily (and naturally) move items around the screen! In this video we will learn how to implement the DragGesture() and then explore two advanced examples of how these gestures are being used in applications.")
                .multilineTextAlignment(.center)
                .padding()
            Text("create account".uppercased())
                .foregroundColor(.white)
                .font(.headline)
                .padding()
                .padding(.horizontal)
                .background(Color.black.cornerRadius(10))
            
            Spacer()
        }
        .foregroundColor(.black)
        .frame(maxWidth: .infinity)
        .background(.white)
        .cornerRadius(30)
        .ignoresSafeArea(edges: .bottom)
    }
}

struct DragGesture__Previews: PreviewProvider {
    static var previews: some View {
        Group {
            //            DragGesture_()
            SwipeGesture()
        }
    }
}
