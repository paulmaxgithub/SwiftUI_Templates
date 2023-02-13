//
//  FocusState_.swift
//  UIElementsProject
//
//  Created by PaulmaX on 6.02.23.
//

import SwiftUI

struct FocusState_: View {
    
    enum SignUpStatus: Hashable { case name, password }
    
    @State private var name: String = ""
    @State private var password: String = ""
    @State private var buttonStatusName: String = "ENTER"
    
    @FocusState private var fieldsInFocus: SignUpStatus?
    
    var body: some View {
        ZStack {
            ///BACKGROUND
            Color.orange.ignoresSafeArea()
            
            ///CONTENT
            VStack {
                TextField("Add your name here...", text: $name)
//                    .focused($userNameInFocus)
                    .focused($fieldsInFocus, equals: .name)
                    .padding(.leading)
                    .frame(height: 50)
                    .frame(maxWidth: .infinity)
                    .background(Color.gray.brightness(0.3))
                    .cornerRadius(10)
                SecureField("Add your password here...", text: $password)
//                    .focused($passwordInFocus)
                    .focused($fieldsInFocus, equals: .password)
                    .padding(.leading)
                    .frame(height: 50)
                    .frame(maxWidth: .infinity)
                    .background(Color.gray.brightness(0.3))
                    .cornerRadius(10)
                
                Button(buttonStatusName) {
                    actionButtonWithStatusAndSignUp()
                }
                .buttonStyle(.borderedProminent)
            }
//            .ignoresSafeArea(.keyboard, edges: .bottom)
            .padding(40)
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    fieldsInFocus = .name
                }
            }
        }
        .ignoresSafeArea()
    }
    
    private func actionButtonWithStatusAndSignUp() {
        if enteredDataIsValid() {
            fieldsInFocus = nil
        } else if !name.isEmpty {
            fieldsInFocus = .password
        } else if !password.isEmpty {
            fieldsInFocus = .name
        }
    }
    
    private func enteredDataIsValid() -> Bool {
        if !name.isEmpty && !password.isEmpty {
            buttonStatusName = "SIGN UP 🚀"
            if fieldsInFocus == nil {
                print("SIGN UP") ///SIGN UP ACTION ⚙️
            }
            return true
        } else {
            return false
        }
    }
}

struct FocusState__Previews: PreviewProvider {
    static var previews: some View {
        FocusState_()
    }
}
