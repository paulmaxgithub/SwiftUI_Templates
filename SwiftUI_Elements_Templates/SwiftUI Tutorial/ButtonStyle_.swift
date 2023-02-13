//
//  ButtonStyle_.swift
//  UIElementsProject
//
//  Created by PaulmaX on 6.02.23.
//

import SwiftUI

struct ButtonStyle_: View {
    var body: some View {
        VStack(spacing: 10) {
            
            Button {
                //Action
            } label: {
                Text(".borderedProminent() - .controlSize(.large) ")
                    .frame(height: 100)
                    .frame(maxWidth: .infinity)
            }
            .buttonStyle(.borderedProminent)
            .controlSize(.large)
            .buttonBorderShape(.capsule)
            .padding()
            
            Button("Button Style .bordered - .controlSize(.large)") {
                //Action
            }
            .frame(height: 100)
            .frame(maxWidth: .infinity)
            .buttonStyle(.bordered)
            .controlSize(.large)
            
            Button("Button Style - .bordered / .controlSize(.small)") {
                //Action
            }
            .frame(height: 100)
            .frame(maxWidth: .infinity)
            .buttonStyle(.bordered)
            .controlSize(.small)
            
            Button("Button Style borderless".uppercased()) {
                //Action
            }
            .frame(height: 70)
            .frame(maxWidth: .infinity)
            .buttonStyle(.borderless)
        }
    }
}

#if DEBUG
struct ButtonStyle__Previews: PreviewProvider { static var previews: some View { ButtonStyle_() } }
#endif
