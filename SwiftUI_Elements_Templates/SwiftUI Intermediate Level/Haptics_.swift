//
//  Haptics_.swift
//  SwiftUI_Elements_Templates
//
//  Created by PaulmaX on 22.02.23.
//

import SwiftUI

fileprivate class HapticManager {
    
    static let instance = HapticManager()
    
    func notification(by type: UINotificationFeedbackGenerator.FeedbackType) {
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(type)
    }
    
    func impact(by style: UIImpactFeedbackGenerator.FeedbackStyle, intensity value: CGFloat) {
        let generator = UIImpactFeedbackGenerator(style: style)
        generator.impactOccurred(intensity: value)
    }
}

struct Haptics_: View {
    var body: some View {
        VStack(spacing: 40) {
            HStack(spacing: 20) {
                Button("success".uppercased()) { HapticManager.instance.notification(by: .success) }
                Button("warning".uppercased()) { HapticManager.instance.notification(by: .warning) }
                Button("error".uppercased()) { HapticManager.instance.notification(by: .error) }
            }.buttonStyle(.borderedProminent)
            
            Divider().frame(width: 350, height: 2).overlay(.pink)
            
            VStack(spacing: 20) {
                Button("soft".uppercased()) { HapticManager.instance.impact(by: .soft, intensity: 1.0) }
                Button("medium".uppercased()) { HapticManager.instance.impact(by: .medium, intensity: 1.0) }
                Button("heavy".uppercased()) { HapticManager.instance.impact(by: .heavy, intensity: 1.0) }
                Button("light".uppercased()) { HapticManager.instance.impact(by: .light, intensity: 1.0) }
                Button("rigid".uppercased()) { HapticManager.instance.impact(by: .rigid, intensity: 1.0) }
            }.buttonStyle(.borderedProminent)
        }
    }
}

struct Haptics__Previews: PreviewProvider {
    static var previews: some View {
        Haptics_()
    }
}
