//
//  Alert_.swift
//  UIElementsProject
//
//  Created by PaulmaX on 30.01.23.
//

import SwiftUI

enum Alerts {
    case success, error
}

struct Alert_: View {
    
    @State var showDefaultAlert:    Bool = false
    @State var showFullAlert:       Bool = false
    
    @State var backgroundColor: Color = .yellow
    
    @State var alertTitle:      String = ""
    @State var alertMessage:    String = ""
    @State var alertType:       Alerts? = nil
    
    var body: some View {
        ZStack {
            ///BACKGROUND
            backgroundColor.ignoresSafeArea()
            
            ///CONTENT
            VStack {
                HStack {
                    Button("Button 1".uppercased()) {
                        backgroundColor = .red
                        alertType = .error
                        showDefaultAlert.toggle()
                    }
                    .buttonStyle(.borderedProminent)
                    .padding()
                    
                    Button("Button 2".uppercased()) {
                        backgroundColor = .blue
                        alertType = .success
                        showDefaultAlert.toggle()
                    }
                    .buttonStyle(.borderedProminent)
                    .padding()
                }
                .alert(isPresented: $showDefaultAlert) { customDefaultAlertView() }
                
                HStack {
                    Button("Button 3".uppercased()) {
                        alertType = .error
                        backgroundColor = Color(uiColor: .systemRed)
                        alertTitle = "Error Uploading Video"
                        alertMessage = "The Video could not be uploaded"
                        showFullAlert.toggle()
                    }
                    .buttonStyle(.borderedProminent)
                    .padding()
                    
                    Button("Button 4".uppercased()) {
                        alertType = .success
                        alertTitle = "Successfully uploaded 🥳"
                        alertMessage = "Your Video Successfully Uploaded"
                        showFullAlert.toggle()
                    }
                    .buttonStyle(.borderedProminent)
                    .padding()
                }
                .alert(isPresented: $showFullAlert) { customFullAlertView() }
                
                Spacer()
            }
        }
    }
    
    private func customDefaultAlertView() -> Alert {
        switch alertType {
        case .error:
            return Alert(title: Text("There was an ERROR!"),
                         dismissButton: .default(Text("CLOSE"), action: { backgroundColor = .yellow }))
        case .success:
            return Alert(title: Text("This was a success!"),
                         dismissButton: .default(Text("OK"), action: { backgroundColor = .yellow }))
        
        default: return Alert(title: Text(""))
        }
    }
    
    private func customFullAlertView() -> Alert {
        switch alertType {
        case .error:
            return Alert(
                title: Text(alertTitle.uppercased()),
                message: Text(alertMessage),
                primaryButton: .destructive(Text("DELETE"), action: { backgroundColor = .yellow }),
                secondaryButton: .cancel())
        case .success:
            return Alert(title: Text(alertTitle), message: Text(alertMessage),
                         dismissButton: .default(Text("OK").bold()))
        default: return Alert(title: Text(""))
        }
    }
}

struct Alert__Previews: PreviewProvider {
    static var previews: some View {
        Alert_()
    }
}
