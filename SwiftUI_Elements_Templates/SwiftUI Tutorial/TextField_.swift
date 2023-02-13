//
//  TextField_.swift
//  UIElementsProject
//
//  Created by PaulmaX on 31.01.23.
//

import SwiftUI

struct TextField_: View {
    
    @State private var txtFieldText: String = ""
    @State private var dataArray: [String] = []
    
    var body: some View {
        NavigationView {
            VStack {
                TextField("Type Something Here...", text: $txtFieldText)
                    .padding()
                    .textFieldStyle(PlainTextFieldStyle())
                    .background(Color.gray.opacity(0.3).cornerRadius(10))
                
                Button {
                    if textIsAppropriate() { saveText() }
                } label: {
                    Text("SAVE")
                        .padding()
                        .frame(maxWidth: .infinity)
                        .foregroundColor(.white)
                        .font(.headline)
                        .background(textIsAppropriate() ? .blue : .gray)
                        .cornerRadius(10)
                }
//                .allowsHitTesting(textIsAppropriate())
                .disabled(!textIsAppropriate())
                
                ForEach(dataArray, id: \.self) { data in
                    Text(data)
                        .background(.gray)
                }
                
                Spacer()
            }
            .padding(.horizontal)
            .navigationTitle("TEXTFIELD")
        }
    }
    
    private func saveText() {
        dataArray.append(txtFieldText)
        txtFieldText = ""
    }
    
    private func textIsAppropriate() -> Bool { txtFieldText.count >= 3 }
}

#if DEBUG
struct TextField__Previews: PreviewProvider { static var previews: some View { TextField_() } }
#endif
