//
//  Text_UIElement.swift
//  SwiftUI_Templates
//
//  Created by PAULMAX on 23.02.2024
//  All rights reserved. © 2024
//

import SwiftUI

//MARK: - CONSTANTS + NAME

fileprivate let title: String = "About Swift"

fileprivate let description: String = """
                • Swift is general-purpose and modern. Suitable for everything from systems programming, through mobile and desktop apps, to cloud services.
                • Swift is safe. Undefined behavior is the enemy of safety, and it’s best to catch mistakes before software goes into production. Swift makes the obvious path the safest.
                • Swift is fast to run and quick to write. It comes with predictable and consistent performance that is on-par with C-based languages without sacrificing developer friendliness.
                • Swift is approachable and powerful. From a single-line “Hello, World!” to large-scale apps with hundreds of thousands of lines. Swift scales with your needs.
                """

fileprivate enum MoreButtonNameState: String {
    case more, less
    var stateName: String {
        switch self {
        case .more: return "more..."
        case .less: return "less..."
        }
    }
}

fileprivate enum CommentTitleState: String {
    case add, edit
    var stateName: String {
        switch self {
        case .add:  return "Add"
        case .edit: return "Edit"
        }
    }
}

fileprivate let saveButtonName: String = "SAVE"

//MARK: - VIEW

struct Text_UIElement: View {
    
    @State private var isMoreButtonTapped:  Bool = false
    @State private var editorTappingText:   String = ""
    @State private var editorSavingText:    String = ""
    @State private var storedComment:       String = ""
    
    @FocusState private var textEditorIsFocused: Bool
    
    var body: some View {
        
        ZStack {
            //MARK: BACKGROUND
            Color.gray.ignoresSafeArea().onTapGesture { resetAndCloseTextEditor() }
            
            //MARK: CONTENT
            VStack {
                
                //TITLE TEXT
                Text(title.uppercased())
                    .font(.system(size: 23, weight: .ultraLight, design: .serif))
                    .bold()
                    .underline(true, color: .yellow)
                    .baselineOffset(15)
                    .kerning(3)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.yellow)
                    .padding(.vertical)
                
                //DESCRIPTION TEXT
                Text(description)
                    .foregroundStyle(Color.black)
                    .font(.footnote)
                    .fontWeight(.light)
                    .multilineTextAlignment(.leading)
                    .baselineOffset(10)
                    .lineLimit(isMoreButtonTapped ? nil : 3)
                    .textSelection(.enabled)
                    .padding(.horizontal)
                
                HStack {
                    Button {
                        tapReadMoreButtonSetup()
                    } label: {
                        Text(moreLess_NameSetup())
                            .font(.callout)
                            .foregroundStyle(.indigo)
                    }
                    
                    Spacer()
                }
                .padding(.horizontal)
                .padding(.bottom)
                
                //COMMENT TEXT
                Text("Comments: " + storedComment)
                    .font(.footnote)
                    .foregroundStyle(.white)
                    .opacity(storedComment.isEmpty ? 0.0 : 0.7)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal)
                
                Divider()
                    .background(
                        Rectangle()
                            .foregroundStyle(Color.white)
                            .opacity(0.5)
                            .frame(height: 2)
                    )
                    .padding()
                
                //ADDITIONAL USER COMMENT TEXT
                TextEditor(text: textEditorPlaceholderSetup())
                ///COLOR SETTINGS
                    .font(.footnote)
                    .foregroundStyle(.white)
                
                ///FRAME
                    .frame(height: textEditorIsFocused ? 100 : 50)
                    .focused($textEditorIsFocused)
                
                ///BACKGROUND
                    .scrollContentBackground(.hidden)
                    .background(
                        RoundedRectangle(cornerRadius: 8.0)
                            .fill(.black.opacity(0.5))
                    )
                    .tint(.white)
                    .padding(.horizontal)
                
                ///BUTTON
                Button {
                    saveComment()
                } label: {
                    Text(saveButtonName)
                        .foregroundStyle(.white)
                        .bold()
                    
                        .padding(8)
                        .padding(.horizontal)
                        .background(RoundedRectangle(cornerRadius: 8.0).foregroundStyle(Color.indigo))
                }
                .opacity(textEditorIsFocused == false || editorTappingText.isEmpty ? 0.0 : 1.0)
                
                Spacer()
            }
        }
    }
    
    //MARK: - VIEWS SETUP
    
    ///"More-Less" Button Name Setup
    private func moreLess_NameSetup() -> String {
        let less = MoreButtonNameState.less.stateName
        let more = MoreButtonNameState.more.stateName
        return isMoreButtonTapped ? less : more
    }
    
    ///"Add-Edit" Comment Title State
    private func commentTitleNameSetup(_ value: String) -> String {
        let add = CommentTitleState.add.stateName
        let edit = CommentTitleState.edit.stateName
        return (value.isEmpty ? add : edit) + " Your Comment:"
    }
    
    ///TextEditor Setup
    private func textEditorPlaceholderSetup() -> Binding<String> {
        if  textEditorIsFocused == false {
            ///USE PLACEHOLDER
            return .constant(commentTitleNameSetup(storedComment))
        }
        else {
            ///USE TEXT EDITOR
            return $editorTappingText
        }
    }
    
    //MARK: - LOGIC
    
    ///Change `readMoreButtonTapped` when `TextEditor` is tapped
    private func tapReadMoreButtonSetup() {
        withAnimation(.bouncy) {
            isMoreButtonTapped.toggle()
        }
    }
    
    ///Reset params by default
    private func resetAndCloseTextEditor() {
        if textEditorIsFocused == true {
            textEditorIsFocused = false
            
            if editorSavingText.isEmpty {
                editorTappingText = ""
                print("RESET ⚠️")
            }
            else if editorSavingText != editorTappingText {
                editorTappingText = editorSavingText
                print("CLOSED UNSAVED ???")
            } else {
                editorSavingText = storedComment
                print("CLOSED ⚠️")
            }
        }
    }
    
    ///Save entered text & show on the screen
    private func saveComment() {
        ///SAVE COMMENT TEXT
        storedComment = editorTappingText
        print("storedComment - \(storedComment)")
        ///SAVE CURRENT EDITOR TEXT
        editorSavingText = editorTappingText
        print("editorSavingText - \(editorSavingText)")
        ///CLOSE EDITOR
        resetAndCloseTextEditor()
    }
}

#if DEBUG
#Preview { Text_UIElement() }
#endif
