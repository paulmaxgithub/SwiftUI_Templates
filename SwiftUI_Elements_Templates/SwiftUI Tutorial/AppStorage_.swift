//
//  AppStorage_.swift
//  UIElementsProject
//
//  Created by PaulmaX on 2.02.23.
//

import SwiftUI

struct AppStorage_: View {
    
    ///USE STATE TO STORE DATA AT CURRENT TIME SESSION
    ///@State private var currentUsername: String?
    
    ///USE @AppStorage TO SAVE VALUE IN APP MEMORY
    @AppStorage("name") var currentUsername: String?
    
    var body: some View {
        VStack(spacing: 20) {
            Text(currentUsername ?? "Add name here")
            
            if let currentUsername = currentUsername {
                Text(currentUsername)
            }
            
            Button("SAVE".uppercased()) {
                let name = "IMAMA"
                currentUsername = name
                
                ///OLD METHOD
                ///UserDefaults.standard.set(name, forKey: "name")
            }
            .buttonStyle(.bordered)
        }
        ///OLD METHOD
        ///.onAppear {
        ///currentUsername = UserDefaults.standard.string(forKey: "name")
        ///}
    }
}

struct AppStorage_Previews: PreviewProvider {
    static var previews: some View {
        AppStorage_()
    }
}
