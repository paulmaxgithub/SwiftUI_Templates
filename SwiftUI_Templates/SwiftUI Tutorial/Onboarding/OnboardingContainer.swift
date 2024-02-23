//
//  OnboardingContainer.swift
//  UIElementsProject
//
//  Created by PaulmaX on 2.02.23.
//

import SwiftUI

//MARK: - START VIEW
struct OnboardingContainer: View {
    
    @AppStorage("sign_in") var userSignedIn: Bool = false
    
    var body: some View {
        ZStack {
            ///BACKGROUND
            backgroundRadialGradient
            
            ///CONTENT
            if userSignedIn {
                ProfileView()
                    .transition(.asymmetric(insertion: .move(edge: .bottom),
                                            removal: .move(edge: .top)))
            } else {
                OnboardingViews()
            }
        }
    }
    
    //MARK: UI ELEMENTS & COMPONENTS
    private var backgroundRadialGradient: some View {
        RadialGradient(gradient: Gradient(colors: [.blue, .orange]),
                       center: .center,
                       startRadius: 1,
                       endRadius: UIScreen.main.bounds.height - (UIScreen.main.bounds.height/3))
            .ignoresSafeArea()
    }
}

struct Onboarding__Previews: PreviewProvider {
    static var previews: some View {
        OnboardingContainer()
    }
}
