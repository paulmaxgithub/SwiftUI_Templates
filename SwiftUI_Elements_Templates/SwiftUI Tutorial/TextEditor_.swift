//
//  TextEditor_.swift
//  UIElementsProject
//
//  Created by PaulmaX on 31.01.23.
//

import SwiftUI

#if canImport(UIKit)
extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder),
                                        to: nil, from: nil, for: nil)
    }
}
#endif

struct TextEditor_: View {
    
    @State private var textEditorText: String = ""
    @State private var savedText: String = ""
    
    var body: some View {
        NavigationView {
            VStack {
                TextEditor(text: $textEditorText)
                    .frame(height: 250)
                    .background(.blue)
                    .foregroundColor(.red)
                
                Button {
                    savedText = textEditorText
                    textEditorText = ""
                    hideKeyboard()
                } label: {
                    Text("SAVE")
                        .foregroundColor(.white)
                        .font(.headline)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(.blue)
                        .cornerRadius(10)
                        .padding()
                }
                Text(savedText)
                    .frame(maxWidth: .infinity)
                    .padding()
                
                Spacer()
                
            }
            .padding()
            .background(.orange)
            .navigationTitle("Text Editor")
        }
    }
}

#if DEBUG
struct TextEditor__Previews: PreviewProvider { static var previews: some View { TextEditor_() } }
#endif
