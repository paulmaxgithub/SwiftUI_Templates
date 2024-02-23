//
//  SubmitLabel_.swift
//  UIElementsProject
//
//  Created by PaulmaX on 7.02.23.
//

import SwiftUI

struct SubmitLabel_: View {
    
    @State private var text: String = ""
    
    var body: some View {
        VStack {
            TextField("Placeholder ...", text: $text)
            ///return button with title "CONTINUE"
                .submitLabel(.continue)
            ///by tapping do something
                .onSubmit {
                    print("CONTINUE ⏱")
            }
            
            TextField("Placeholder ...", text: $text)
            ///return button with title "DONE"
                .submitLabel(.done)
            ///by tapping do something
                .onSubmit {
                    print("DONE ✅")
            }

            TextField("Placeholder ...", text: $text)
            ///return button with title "SEARCH"
                .submitLabel(.search)
            ///by tapping do something
                .onSubmit {
                    print("SEARCH 🔍")
            }

        }
    }
}

struct SubmitLabel__Previews: PreviewProvider {
    static var previews: some View {
        SubmitLabel_()
    }
}
