//
//  ProfileView.swift
//  UIElementsProject
//
//  Created by PaulmaX on 6.02.23.
//

import SwiftUI

struct ProfileView: View {
    
    @AppStorage("name") var currentUserName:        String?
    @AppStorage("age") var currentUserAge:          Int?
    @AppStorage("gender") var currentUserGender:    String?
    @AppStorage("sign_in") var currentUserSignedIn: Bool = false
    
    var body: some View {
        VStack(spacing: 5) {
            Image(systemName: "person.crop.circle")
                .resizable()
                .scaledToFit()
                .frame(width: 150, height: 150)
                .padding()
            Text(currentUserName ?? "No Name")
            Text("Age: \(currentUserAge ?? 0)")
            Text("Gender: \(currentUserGender ?? "No Gender")")
            
            Text("Sign Out")
                .foregroundColor(.white)
                .font(.headline)
                .frame(height: 50)
                .frame(maxWidth: .infinity)
                .background(.gray)
                .cornerRadius(10)
                .padding(.top, 20)
                .onTapGesture { signOut() }
        }
        .font(.title2)
        .foregroundColor(.purple)
        .padding(.horizontal, 40)
        .padding(.vertical, 40)
        .background(.white)
        .cornerRadius(10)
        .shadow(radius: 10)
        .padding()
        
    }
    
    private func signOut() {
        currentUserName     = nil
        currentUserAge      = nil
        currentUserGender   = nil
        
        withAnimation { currentUserSignedIn = false }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
