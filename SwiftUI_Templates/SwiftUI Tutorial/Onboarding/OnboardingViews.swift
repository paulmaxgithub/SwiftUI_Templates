//
//  OnboardingViews.swift
//  UIElementsProject
//
//  Created by PaulmaX on 6.02.23.
//

import SwiftUI

struct OnboardingViews: View {
    
    enum Gender: String, CaseIterable { case Man, Woman }
    
    init() {
        UISegmentedControl.appearance().selectedSegmentTintColor = .white
        let selectedTextAttributes = [
            NSAttributedString.Key.foregroundColor: UIColor.purple,
            NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 15)]
        let normalTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        
        UISegmentedControl.appearance().setTitleTextAttributes(selectedTextAttributes, for: .selected)
        UISegmentedControl.appearance().setTitleTextAttributes(normalTextAttributes, for: .normal)
    }
    
    let transition: AnyTransition =
        .asymmetric(insertion: .move(edge: .trailing), removal: .move(edge: .leading))
    
    @State var onboardingState:     Int = 0
    @State var textFieldName:       String = ""
    @State var sliderValueAge:      Double = 50
    @State var pickerValueGender:   String = Gender.Man.rawValue
    
    @State var alertTitle:  String = ""
    @State var showAlert:   Bool = false
    
    @AppStorage("name") var currentUserName:        String?
    @AppStorage("age") var currentUserAge:          Int?
    @AppStorage("gender") var currentUserGender:    String?
    @AppStorage("sign_in") var currentUserSignedIn: Bool = false
    
    var body: some View {
        ZStack {
            ZStack {
                switch onboardingState {
                case 0: welcomeSection.transition(transition)
                case 1: addNameSection.transition(transition)
                case 2: addAgeSection.transition(transition)
                case 3: addGenderSection.transition(transition)
                default: RoundedRectangle(cornerRadius: 25)
                        .foregroundColor(.orange)
                }
            }
            
            VStack {
                Spacer()
                signInButton
            }
        }
        .ignoresSafeArea(.keyboard, edges: .bottom)
        
        //ALERT
        .alert(isPresented: $showAlert, content: { Alert(title: Text(alertTitle)) })
    }
    
    //MARK: UI ELEMENTS & COMPONENTS
    private var signInButton: some View {
        Text(onboardingState == 0 ? "Continue" :
                (onboardingState == 1 || onboardingState == 2) ? "Next" : "Sign In")
            .font(.headline)
            .foregroundColor(.purple)
            .frame(height: 55)
            .frame(maxWidth: .infinity)
            .background(.white)
            .cornerRadius(10)
            .animation(nil, value: onboardingState)
            .onTapGesture { nextButtonPressed()
            }
            .padding(30)
    }
    
    private var welcomeSection: some View {
        VStack(spacing: 40.0) {
            Spacer()
            Image(systemName: "heart.text.square")
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 200)
                .foregroundColor(.white)
            Text("Find Your Match")
                .foregroundColor(.white)
                .fontWeight(.semibold)
                .font(.largeTitle)
                .overlay(alignment: .bottom) {
                    Capsule(style: .continuous)
                        .frame(height: 3)
                        .offset(y: 5)
                        .foregroundColor(.white)
                }
            Text("This is the #1 app for finding your match online! In this tutorial we are practicing using AppStorage and other SwiftUI techniques")
                .fontWeight(.medium)
                .foregroundColor(.white)
            Spacer()
            Spacer()
        }
        .padding(40)
    }
    
    private var addNameSection: some View {
        VStack(spacing: 40.0) {
            Spacer()
            Text("What's your name?")
                .foregroundColor(.white)
                .fontWeight(.semibold)
                .font(.largeTitle)
            TextField("Write your name here...", text: $textFieldName)
                .font(.headline)
                .foregroundColor(.purple)
                .frame(height: 55)
                .padding(.horizontal)
                .background(.white)
                .cornerRadius(10)
            Spacer()
            Spacer()
        }
        .padding(30)
    }
    
    private var addAgeSection: some View {
        VStack(spacing: 40.0) {
            Spacer()
            Text("What's your age?")
                .foregroundColor(.white)
                .fontWeight(.semibold)
                .font(.largeTitle)
            Text("\(Int(sliderValueAge))")
                .font(.largeTitle)
                .foregroundColor(.white)
            Slider(value: $sliderValueAge, in: 18...100, step: 1)
                .accentColor(.white)
            Spacer()
            Spacer()
        }
        .padding(30)
    }
    
    private var addGenderSection: some View {
        VStack(spacing: 40.0) {
            Spacer()
            Text("What's your gender?")
                .foregroundColor(.white)
                .fontWeight(.semibold)
                .font(.largeTitle)
            Picker(selection: $pickerValueGender, label: Text("Picker")) {
                ForEach(Gender.allCases.indices) { index in
                    Text(Gender.allCases[index].rawValue).tag(Gender.allCases[index].rawValue)
                }
            }
            .pickerStyle(.segmented)
            .background(Color(.systemGray3))
            .cornerRadius(7)
            .padding(10)
            
            Spacer()
            Spacer()
        }
        .padding(30)
    }
    
    //MARK: FUNCTIONS
    private func nextButtonPressed() {
        
        //CHECK INPUTS
        switch onboardingState {
        case 1:
            guard textFieldName.count >= 3 else {
                showAlert(title: "Your name must contain at least 3 charactar long 🤐")
                return
            }
        default: break
        }
        
        //GO TO NEXT SECTION
        if onboardingState == 3 {
            signIn()
        } else {
            withAnimation(.spring()) { onboardingState += 1 }
        }
    }
    
    private func signIn() {
        currentUserName = textFieldName
        currentUserAge = Int(sliderValueAge)
        currentUserGender = pickerValueGender
        
        withAnimation(.spring()) { currentUserSignedIn = true }
    }
    
    private func showAlert(title: String) {
        alertTitle = title
        showAlert.toggle()
    }
}

//MARK: OnboardingViews_Previews
struct OnboardingViews_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingViews().background(.purple)
    }
}
