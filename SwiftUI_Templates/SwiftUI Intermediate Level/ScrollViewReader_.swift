//
//  ScrollViewReader_.swift
//  SwiftUI_Elements_Templates
//
//  Created by PaulmaX on 17.02.23.
//

import SwiftUI

struct ScrollViewReader_: View {
    
    @State private var textFieldText: String = ""
    
    var body: some View {
        VStack {
            TextField("Enter a index from 0 to 19...", text: $textFieldText)
                .frame(height: 55)
                .padding(.horizontal, 10)
                .border(.gray, width: 3)
                .padding()
                .keyboardType(.numberPad)
            
            ScrollView {
                ScrollViewReader { proxy in
                    LazyVGrid(columns: [GridItem(.flexible())], pinnedViews: [.sectionHeaders]) {
                        Section {
                            ForEach(0..<20) { index in
                                Text("Item with index - \(index)")
                                    .foregroundColor(.primary)
                                    .font(.headline)
                                    .frame(height: 200)
                                    .frame(maxWidth: .infinity)
                                    .background(.white)
                                    .cornerRadius(10)
                                    .shadow(radius: 10)
                                    .padding()
                                    .id(index)
                            }
                        } header: {
                            Button("CLICK TO GO TO INDEX #\(textFieldText)") {
                                withAnimation(.spring()) {
                                    if let index = Int(textFieldText) {
                                        proxy.scrollTo(index, anchor: .center)
                                    }
                                }
                            }
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(.orange)
                        }
                    }
                }
            }
        }
    }
}

struct ScrollViewReader_Previews: PreviewProvider {
    static var previews: some View {
        ScrollViewReader_()
    }
}
