//
//  PIcker_.swift
//  UIElementsProject
//
//  Created by PaulmaX on 31.01.23.
//

import SwiftUI

struct PIcker_: View {
    
    @State private var statusSelection: String = "Most Recent"
    @State private var ageSelection: String = "00"
    @State private var menuSelection: String = "00"
    
    
    let filterOptions: [String] = ["Most Recent", "Most Popular", "Most Liked"]
    
    init() {
        UISegmentedControl.appearance().selectedSegmentTintColor = .red
        
        let titleTextAttributes = [
            NSAttributedString.Key.foregroundColor: UIColor.white,
            NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 15)]
        
        UISegmentedControl.appearance().setTitleTextAttributes(titleTextAttributes, for: .selected)
    }
    
    var body: some View {
        
        ZStack {
            ///BACKGROUND
            Color.orange.ignoresSafeArea()
            
            ///CONTENT
            //MARK: - .segmented
            VStack {
                HStack {
                    Text("Status:")
                    Spacer()
                    Text(statusSelection).bold()
                }.font(.title).padding(.horizontal, 50)
                
                Picker(selection: $statusSelection, label: Text("Picker")) {
                    ForEach(filterOptions.indices) { index in
                        Text(filterOptions[index]).tag(filterOptions[index])
                    }
                }
                .pickerStyle(.segmented)
                .background(.white)
                .cornerRadius(7)
                .padding(20)
                
                Spacer()
                
                //MARK: - .wheel
                HStack {
                    Text("Age:")
                    Text(ageSelection).bold()
                }.font(.title)
                
                Picker(selection: $ageSelection) {
                    ForEach(17..<55) {
                        Text("\($0)")
                            .tag("\($0)")
                            .font(.title)
                            .foregroundColor(.white)
                    }
                } label: {
                    Text("Picker")
                }
                .frame(width: 100, height: 150)
                .pickerStyle(.wheel)
                .background(.selection)
                .cornerRadius(10)
                
                Spacer()
                
                //MARK: - .menu
                Picker("", selection: $menuSelection) {
                    ForEach(filterOptions, id: \.self) { opt in
                        ///MENU ITEMS
                        HStack {
                            Text("\(opt)").tag(opt)
                            Image(systemName: "heart.fill").tint(.red)
                        }
                    }
                }
                .pickerStyle(.menu)
                .padding()
            }
        }
    }
}

struct PIcker__Previews: PreviewProvider {
    static var previews: some View {
        PIcker_()
    }
}
