//
//  Stepper_.swift
//  UIElementsProject
//
//  Created by PaulmaX on 31.01.23.
//

import SwiftUI

struct Stepper_: View {
    
    @State var incrementWidth:  CGFloat = 0
    
    @State var value: CGFloat {
        didSet {
            if value != oldValue { hapticsPlay() }
        }
    }
    
    private let padding_20:             CGFloat = 20
    private let roundedRectWidth_50:    CGFloat = 50
    private let screenWidth = UIScreen.main.bounds.width
    
    var body: some View {
        VStack(alignment: .leading) {
            
            let currentScreenWidth = screenWidth - (padding_20 * 2) - roundedRectWidth_50
            
            
            RoundedRectangle(cornerRadius: 25)
                .frame(width: roundedRectWidth_50 + incrementWidth,
                       height: roundedRectWidth_50  + incrementWidth)
                .animation(.spring(), value: value)
                .padding(padding_20)
            
            Spacer()
            
            Stepper("STEPPER WIDTH: \(Int(value))",
                    value: $incrementWidth,
                    in: 0...currentScreenWidth,
                    step: currentScreenWidth,
                    onEditingChanged: { _ in value = roundedRectWidth_50 + incrementWidth})
            
                .padding(50)
                .foregroundColor(.orange)
                .font(.title2)
        }
    }
    
    private func hapticsPlay() {
//        Haptics.shared.play(.rigid)
        Haptics.shared.notify(.warning)
    }
}

struct Stepper__Previews: PreviewProvider {
    static var previews: some View {
        Stepper_(value: 50)
    }
}

fileprivate class Haptics {
    
    static let shared = Haptics()
    
    private init() {}
    
    func play(_ feedbackStyle: UIImpactFeedbackGenerator.FeedbackStyle) {
        UIImpactFeedbackGenerator(style: feedbackStyle).impactOccurred()
    }
    
    func notify(_ feedbackType: UINotificationFeedbackGenerator.FeedbackType) {
        UINotificationFeedbackGenerator().notificationOccurred(feedbackType)
    }
}
