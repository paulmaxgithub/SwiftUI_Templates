//
//  Publisher_Subscriber_.swift
//  SwiftUI_Elements_Templates
//
//  Created by PaulmaX on 11.03.23.
//

import SwiftUI

struct Publisher_Subscriber_: View {
    
    var body: some View {
        
        NavigationView {
            VStack {
                NavigationLink("NEXT") {
                    PS_SecondScreen()
                        .font(.largeTitle)
                }
            }
            .navigationTitle("Deinit Test")
        }
        .navigationViewStyle(.stack)
    }
}

struct PS_SecondScreen: View {
    
    @StateObject var vm = Pub_Sub_ViewModel()
    
    var body: some View {
        VStack {
            Text("\(vm.count)")
                .font(.largeTitle)
            
            TextField("Here Your Text...", text: $vm.textFiledText)
                .padding(.leading)
                .frame(height: 55)
                .font(.headline)
                .textFieldStyle(PlainTextFieldStyle())
                .background(Color.gray.opacity(0.3).cornerRadius(10))
                .overlay(alignment: .trailing, content: {
                    ZStack {
                        Image(systemName: "xmark")
                            .foregroundColor(.red)
                            .opacity( vm.textFiledText.count < 1 ? 0 : vm.textIsValid ? 0 : 1)
                        Image(systemName: "checkmark")
                            .foregroundColor(.green)
                            .opacity(vm.textIsValid ? 1 : 0)
                    }
                    .font(.headline)
                    .padding(.trailing)
                })
            
            Button {
                //
            } label: {
                Text("SUBMIT")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .background(Color.orange.cornerRadius(10))
                    .opacity(vm.showButton ? 1 : 0.5)
            }
            .disabled(!vm.showButton)
        }
        .padding(.horizontal)
        .onDisappear {
            //            vm.invalidate()
        }
    }
}

/**
 
 DeferCreatingView(of: Publisher_Subscriber_SecondScreen.self)
 
 protocol Constructable {
 init()
 }
 
 struct DeferCreatingView<T: View & Constructable>: View {
 var ViewType: T.Type
 init(of type: T.Type) { ViewType = type }
 var body: some View { ViewType.init() } // << create only here
 }
 
 struct Publisher_Subscriber__Previews: PreviewProvider {
 static var previews: some View {
 Publisher_Subscriber_()
 }
 }
 */
