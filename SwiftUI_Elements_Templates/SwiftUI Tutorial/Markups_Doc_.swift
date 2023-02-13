//
//  Markups_Doc_.swift
//  UIElementsProject
//
//  Created by PaulmaX on 1.02.23.
//

import SwiftUI

struct Markups_Doc_: View {
    
    //MARK: PROPERTIES
    @State private var fruits: [String] = ["apples 🍎", "oranges 🍊", "bananas 🍌"]
    @State private var showAlert: Bool = false
    
    //MARK: BODY
    
    // NICK - Created by PaulmaX on 1.02.23:
    /*
     1. Fix Alert
     2. Fix Title
     */
    
    var body: some View {
        NavigationView { // START: NAV
            ZStack {
                //backgrpound
                Color.orange.ignoresSafeArea()
                
                //foreground
                scrollViewLayer
                    .navigationTitle("Documentation")
                    .navigationBarItems(trailing: alertButton)
            }
        } // END: NAV
        
        //ALERT
        .alert(isPresented: $showAlert, content: { getAlert("Alert For User!") })
    }
    
    //MARK: CUSTOM ITEMS
    private var alertButton: some View {
        Button {
            showAlert.toggle()
        } label: {
            Text("ALERT")
                .bold()
        }
    }
    
    private var scrollViewLayer: some View {
        ScrollView {
            VStack {
                ForEach(fruits, id: \.self) {
                    Text("\($0)")
                        .padding()
                        .font(.headline)
                }
            }
        }
    }
    
    //MARK: FUNCTIONS
    /// Gets an alert with a specified title
    ///
    /// This function creates and returns an alert immediately
    /// The alert will have a title based on the text parameter,
    /// but it will NOT have a message.
    ///```
    ///getAlert(_ text: "Hi!!!") -> Alert(title: Text("Hi!!!"))
    ///```
    /// - Warning: There is no additional message in this alert!
    /// - Parameter text: A title for the alert
    /// - Returns: return an alert with a title
    private func getAlert(_ text: String) -> Alert {
        return Alert(title: Text(text))
    }
}

//MARK: PREVIEW
struct Markups_Doc__Previews: PreviewProvider {
    static var previews: some View {
        Markups_Doc_()
    }
}
