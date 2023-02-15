//
//  SwiftUI_Elements_TemplatesApp.swift
//  SwiftUI_Elements_Templates
//
//  Created by PaulmaX on 8.02.23.
//

import SwiftUI

@main
struct SwiftUI_Elements_TemplatesApp: App {
    
    //MARK: - TODO LIST APP MVVM
    @StateObject var listViewModel = ListViewModel()
    
    var body: some Scene {
        WindowGroup {
            //MARK: - TODO LIST APP MVVM
            NavigationView {
                ListView()
            }
            /// for iPad presentation
            .navigationViewStyle(.stack)
            .environmentObject(listViewModel)
        }
    }
}
