//
//  Animation_Text_.swift
//  SwiftUI_Elements_Templates
//
//  Created by PaulmaX on 29.05.23.
//

import SwiftUI

struct LaunchView: View {
    
    @State private var loadingText: [String] = "Loading Your Profile...".map { String($0) }
    @State private var isLoading: Bool = false
    @State private var counter: Int = 0
    
    private let timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        ZStack(alignment: .center) {
            //BACKGROUND
            Color.gray.ignoresSafeArea()
            
            //CONTENT
            ZStack {
                if isLoading {
                    HStack(spacing: 1) {
                        ForEach(loadingText.indices) { index in
                            Text(loadingText[index])
                                .font(.headline)
                                .fontWeight(.heavy)
                                .foregroundColor(.white)
                                .offset(y: counter == index ? -5 : 0)
                        }
                    }
                    .transition(.scale.animation(.easeIn))
                }
            }
            .onReceive(timer) { _ in
                withAnimation {
                    let lastIndex = loadingText.count - 1
                    if counter == lastIndex {
                        counter = 0
                    } else {
                        counter += 1
                    }
                }
            }
        }
        .onAppear(perform: { isLoading.toggle() })
        .onDisappear { isLoading.toggle(); timer.upstream.connect().cancel() }
    }
}

struct LaunchView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchView()
    }
}
