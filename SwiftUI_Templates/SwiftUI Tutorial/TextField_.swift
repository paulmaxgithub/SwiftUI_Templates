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
                    .modifier(TextField_DecimalPad_Modifier())
                
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

struct TextField_DecimalPad_Modifier: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .font(.headline)
        //.frame(width: size.width, height: size.height)
            .multilineTextAlignment(.center)
            .keyboardType(.decimalPad)
//            .submitLabel(.return)
            .padding()
        //.textFieldStyle(PlainTextFieldStyle())
        //.background(Color.gray.opacity(0.3).cornerRadius(10))
            .background(RoundedRectangle(cornerRadius: 10).fill(.white))
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    Button {
                        UIApplication.shared.endEditing()
                    } label: {
                        Text("ENTER")
                            .font(.headline)
                    }
                }
            }
    }
}

extension UIApplication {
    /// Dismisses the keyboard
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
