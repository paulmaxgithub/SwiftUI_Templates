//
//  Sheet_FullScreenCover_.swift
//  UIElementsProject
//
//  Created by PaulmaX on 29.01.23.
//

import SwiftUI

struct Sheet_FullScreenCover_: View {
    
    @State var showSheet:       Bool = false
    @State var showFullScreen:  Bool = false
    
    var body: some View {
        ZStack {
            ///BACKGROUND
            Color.green.ignoresSafeArea()
            
            ///CONTENT
            VStack {
                Button {
                    showSheet.toggle()
                } label: {
                    Text("SHEET")
                        .foregroundColor(.green)
                        .font(.headline)
                        .padding(20)
                        .background(Color.white.cornerRadius(10))
                }
                
                Button {
                    showFullScreen.toggle()
                } label: {
                    Text("fullScreen".uppercased())
                        .foregroundColor(.green)
                        .font(.headline)
                        .padding(20)
                        .background(Color.white.cornerRadius(10))
                }
            }
        }
        
        //SHEET & FULLSCREENCOVER
        .sheet(isPresented: $showSheet) { SecondView() }
        .fullScreenCover(isPresented: $showFullScreen) { SecondView() }
    }
}

struct SecondView: View {
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            ///BACKGROUND
            Color.red.ignoresSafeArea()
            
            ///CONTENT
            Button {
                dismiss()
            } label: {
                Image(systemName: "xmark")
                    .foregroundColor(.white)
                    .font(.largeTitle)
                    .padding(20)
            }
        }
    }
}

#if DEBUG
struct SheetsFullScreens_Previews: PreviewProvider {
    static var previews: some View {
        Sheet_FullScreenCover_()
    }
}
#endif
