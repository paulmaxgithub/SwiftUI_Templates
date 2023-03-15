//
//  FileManager_.swift
//  SwiftUI_Elements_Templates
//
//  Created by PaulmaX on 13.03.23.
//

import SwiftUI

struct FileManager_: View {
    
    @StateObject var vm = FileManager_VM()
    
    var body: some View {
        NavigationView {
            VStack {
                if let image = vm.image {
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 200, height: 200)
                        .clipped()
                        .cornerRadius(10)
                        .padding()
                    
                } else {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(.gray)
                        .frame(width: 200, height: 200)
                }
                    
                    VStack {
                        Button {
                            vm.saveImageToFileManager()
                        } label: {
                            CustomButtonView(stringOfButton: "Save to FileManager",
                                             textColor: .white, backColor: .purple)
                        }
                        
                        Button {
                            vm.deleteImageFromFileManager()
                        } label: {
                            CustomButtonView(stringOfButton: "Delete from FileManager",
                                             textColor: .yellow, backColor: .brown)
                        }
                    }
                    .fixedSize(horizontal: true, vertical: true)
                
                Text(vm.infoMessage)
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                    .foregroundColor(.purple)
                    .padding()
                    
                    Spacer()
                
            }
            .navigationTitle("File Manager")
        }
    }
}

struct CustomButtonView: View {
    
    var stringOfButton: String
    var textColor: Color
    var backColor: Color
    
    var body: some View {
        Text(stringOfButton)
            .foregroundColor(textColor)
            .frame(maxWidth: .infinity)
            .padding()
            .background(backColor.cornerRadius(10))
    }
}

struct FileManager__Previews: PreviewProvider {
    static var previews: some View {
        FileManager_()
    }
}
