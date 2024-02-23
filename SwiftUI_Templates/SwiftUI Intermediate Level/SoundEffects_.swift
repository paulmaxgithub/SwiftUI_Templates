//
//  SoundEffects_.swift
//  SwiftUI_Elements_Templates
//
//  Created by PaulmaX on 22.02.23.
//

import SwiftUI
import AVKit

fileprivate class SoundManager {
    
    enum Sound: String {
        case tinyBell = "tiny_bell"
        case bellRings = "bell_rings"
    }
    
    static let instance = SoundManager()
    
    var player: AVAudioPlayer?
    
    func play(with itemOF: Sound) {
        
        player?.volume = 1.0
        
        guard let soundURL = Bundle.main.url(forResource: itemOF.rawValue, withExtension: "mp3") else { return }
        do {
            player = try AVAudioPlayer(contentsOf: soundURL)
            player?.play()
        } catch (let error) {
            fatalError(error.localizedDescription)
        }
    }
}

struct SoundEffects_: View {
    
    var body: some View {
        VStack(spacing: 40) {
            Button("Play Sound 🔔") {
                SoundManager.instance.play(with: .bellRings)
            }
            Button("Play Sound ☎️") {
                SoundManager.instance.play(with: .tinyBell)
            }
        }
    }
}

struct SoundEffects__Previews: PreviewProvider {
    static var previews: some View {
        SoundEffects_()
    }
}
