//
//  Toggle_.swift
//  UIElementsProject
//
//  Created by PaulmaX on 31.01.23.
//

import SwiftUI

struct Toggle_: View {
    
    @State var isOn: Bool = false
    
    var body: some View {
        
        VStack {
            
            HStack(alignment: .center) {
                
                Text("STATUS:")
                    .padding(.leading, 90)
                Spacer()
                Text(isOn ? "Online" : "Offline")
                    .padding(.trailing, 90)
                    .foregroundColor(isOn ? .green : .gray)
            }
            .font(.title)
            
            Toggle(isOn: $isOn) {
                Text("CHANGE STATUS")
            }
            .padding()
            .toggleStyle(SwitchToggleStyle(tint: .red))
            
            Toggle(isOn: $isOn) {
                Text(isOn ? "CHANGE STATUS OFF" : "CHANGE STATUS ON")
            }
            .padding()
            .toggleStyle(.button)
            
            Toggle(isOn: $isOn) {
                Text("CHANGE STATUS")
            }
            .padding()
            .toggleStyle(.automatic)
            
            Spacer()
        }
        .padding(.top, 50)
    }
}

struct Toggle__Previews: PreviewProvider {
    static var previews: some View {
        Toggle_()
    }
}
