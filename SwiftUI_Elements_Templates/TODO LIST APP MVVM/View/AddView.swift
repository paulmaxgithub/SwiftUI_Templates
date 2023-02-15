//
//  AddView.swift
//  SwiftUI_Elements_Templates
//
//  Created by PaulmaX on 13.02.23.
//

import SwiftUI

fileprivate enum TextFieldState {
    case title
}

struct AddView: View {
    
    @Environment(\.dismiss) var dismiss
    
    @State private var textFieldText: String = ""
    @State private var alertTitle: String = ""
    @State private var showAlert: Bool = false
    
    @FocusState private var titleIsFocused: TextFieldState?
    
    @EnvironmentObject private var viewModel: ListViewModel
    
    var body: some View {
        ScrollView {
            VStack {
                TextField("Create new item with name...", text: $textFieldText)
                    .focused($titleIsFocused, equals: .title)
                    .padding(.horizontal)
                    .frame(height: 55)
                    .background(.quaternary)
                    .cornerRadius(10)
                
                Button {
                    saveButtonPressed()
                } label: {
                    Text("SAVE")
                        .foregroundColor(.white)
                        .font(.headline)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(Color.accentColor)
                        .cornerRadius(10)
                }
                .disabled(!textFieldIsNotEmpty())
            }
            .padding(14)
        }
        .navigationTitle("Add an Item 🖊")
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                titleIsFocused = .title
            }
        }
        
        ///ALERT SETUP
        .alert(isPresented: $showAlert) { alertSetup() }
    }
    
    private func saveButtonPressed() {
        if textIsAppropriate() {
            viewModel.addItem(textFieldText)
            dismiss()
        }
    }
    
    private func textFieldIsNotEmpty() -> Bool {
        textFieldText.count != 0
    }
    
    private func textIsAppropriate() -> Bool {
        if textFieldText.count < 3 {
            alertTitle = "Your new todo item must contain more description..."
            showAlert.toggle()
            return false
        } else {
            return true
        }
    }
    
    private func alertSetup() -> Alert {
        Alert(title: Text(alertTitle))
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AddView()
        }
        .environmentObject(ListViewModel())
    }
}
