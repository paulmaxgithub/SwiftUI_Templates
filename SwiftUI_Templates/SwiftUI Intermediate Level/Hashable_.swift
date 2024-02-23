//
//  Hashable_.swift
//  SwiftUI_Elements_Templates
//
//  Created by PaulmaX on 23.02.23.
//

import SwiftUI

struct CustomModel_1: Hashable {
    let title: String
}

struct CustomModel_2: Identifiable {
    var id = UUID().uuidString
    let title: String
}

struct CustomModel_3: Hashable {
    let title: String
    let subtitle: String
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(title + subtitle)
    }
}

struct Hashable_: View {
    
    let data: [String] = [
        "1", "2", "MOM"
    ]
    
    let customModel_1_Data: [CustomModel_1] = [
        CustomModel_1(title: "1"),
        CustomModel_1(title: "2"),
        CustomModel_1(title: "MOM"),
    ]
    
    let customModel_2_Data: [CustomModel_2] = [
        CustomModel_2(title: "1"),
        CustomModel_2(title: "2"),
        CustomModel_2(title: "MOM"),
    ]
    
    let customModel_3_Data: [CustomModel_3] = [
        CustomModel_3(title: "1", subtitle: "asd"),
        CustomModel_3(title: "2", subtitle: "asd"),
        CustomModel_3(title: "MOM", subtitle: "asd"),
    ]
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                ForEach(data, id: \.self) {
                    Text($0.hashValue.description)
                        .font(.headline)
                }
                
                Divider().frame(width: 350, height: 2).overlay(.pink)
                
                ForEach(customModel_1_Data, id: \.self) {
                    Text($0.hashValue.description)
                        .font(.headline)
                }
                
                Divider().frame(width: 350, height: 2).overlay(.pink)
                
                ForEach(customModel_2_Data) {
                    Text($0.id)
                        .font(.headline)
                }
                
                Divider().frame(width: 350, height: 2).overlay(.pink)
                
                ForEach(customModel_3_Data, id: \.self) {
                    Text($0.hashValue.description)
                        .font(.headline)
                }
            }
        }
    }
}

struct Hashable__Previews: PreviewProvider {
    static var previews: some View {
        Hashable_()
    }
}
