//
//  OnAppear_OnDisappear_.swift
//  UIElementsProject
//
//  Created by PaulmaX on 1.02.23.
//

import SwiftUI

struct OnAppear_OnDisappear_: View {
    
    @State private var text: String = "Start Text"
    @State private var count: Int = 0
    
    var body: some View {
        VStack {
            NavigationView {
                ScrollView {
                    Text(text)
                    
                    LazyVStack {
                        ForEach(0..<50) { _ in
                            RoundedRectangle(cornerRadius: 25)
                                .frame(height: 200)
                                .padding()
                                .onAppear {
                                    count += 1
                                }
                        }
                    }
                }
                .onAppear(perform: {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                        text = "New Value For Text"
                    }
                })
                .onDisappear(perform: {
                    text = "End Text"
                })
                .navigationTitle("On Appear: \(count)")
            }
        }
    }
}

struct OnAppear_OnDisappear__Previews: PreviewProvider {
    static var previews: some View {
        OnAppear_OnDisappear_()
    }
}
