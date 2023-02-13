//
//  NavigationView_.swift
//  UIElementsProject
//
//  Created by PaulmaX on 29.01.23.
//

import SwiftUI

struct NavigationView_: View {
    var body: some View {
        
        NavigationView {
            ScrollView {
                
                Spacer()
                NavigationLink("LINK") { SecondGreenScreen() }.padding()
                
                Text("Without LINK").padding()
                Text("Without LINK").padding()
            }
            .navigationTitle("ALL INBOXES")
            //            .navigationBarTitleDisplayMode(.automatic)
            //            .navigationBarHidden(false)
            
            .navigationBarItems(
                leading: Image(systemName: "person.fill"),
                trailing: NavigationLink("Navigation", destination: { Text("DESTINATION") }))
        }
    }
}

struct SecondGreenScreen: View {
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ZStack {
            Color.green.ignoresSafeArea()
                .navigationTitle("Green Screen")
            //                .navigationBarHidden(true)
            
            VStack {
                //                HStack {
                //                    Button("BACK") {
                //                        dismiss()
                //                    }
                //                    .padding()
                //                    Spacer()
                //                }
                //                .padding(.horizontal)
                
                Spacer()
                NavigationLink("CLICK HERE", destination: Text("SCREEN #3"))
                Spacer()
            }
            .frame(width: UIScreen.main.bounds.width)
        }
    }
}

#if DEBUG
struct NavigationView_Previews: PreviewProvider { static var previews: some View { NavigationView_() } }
#endif
