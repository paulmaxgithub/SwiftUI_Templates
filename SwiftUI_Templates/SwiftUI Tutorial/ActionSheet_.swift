//
//  ActionSheet_.swift
//  UIElementsProject
//
//  Created by PaulmaX on 30.01.23.
//

import SwiftUI

enum ActionSheetOptions {
    case isMyPost, isOtherPost
}

struct ActionSheet_: View {
    
    @State var showActionSheet:     Bool = false
    @State var actionSheetOption:   ActionSheetOptions? = nil
    
    var body: some View {
        
        VStack {
            HStack {
                Image("G_png")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 30, height: 30)
                    .clipShape(Circle())
                        
                Text("@username")
                
                Spacer()
                
                HStack {
                    Button {
                        actionSheetOption = .isMyPost
                        showActionSheet.toggle()
                    } label: {
                        Image(systemName: "ellipsis")
                            .font(.title)
                    }
                    
                    Button {
                        actionSheetOption = .isOtherPost
                        showActionSheet.toggle()
                    } label: {
                        Image(systemName: "ellipsis")
                            .font(.title)
                    }
                }
            }
            .padding(.horizontal)
            
            Image("wwdc").resizable().aspectRatio(1.0, contentMode: .fit)
            
            Spacer()
        }
        .actionSheet(isPresented: $showActionSheet) { getActionSheetWithTitleMessageButton() }
    }
    
    private func getActionSheetWithTitleMessageButton() -> ActionSheet {
        
        let shareButton: ActionSheet.Button     = .default(Text("Share")) {  }
        let editButton: ActionSheet.Button      = .default(Text("Edit")) { }
        let reportButton: ActionSheet.Button    = .destructive(Text("REPORT")) { }
        let deleteButton: ActionSheet.Button    = .destructive(Text("DELETE")) { }
        let cancelButton: ActionSheet.Button    = .cancel()
        
        switch actionSheetOption {
        case .isMyPost:
            return ActionSheet(title: Text("Action Sheet"),
                               message: Text("My Post".uppercased()),
                               buttons: [shareButton, editButton, deleteButton, cancelButton])
        case .isOtherPost:
            return ActionSheet(title: Text("Action Sheet"),
                               message: Text("Other Post".uppercased()),
                               buttons: [shareButton, reportButton, cancelButton])
        
        default: return ActionSheet(title: Text(""))
        }
    }
}

struct ActionSheet__Previews: PreviewProvider {
    static var previews: some View {
        ActionSheet_()
    }
}
