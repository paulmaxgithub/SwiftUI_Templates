//
//  NoItemsView.swift
//  SwiftUI_Elements_Templates
//
//  Created by PaulmaX on 15.02.23.
//

import SwiftUI

struct NoItemsView: View {
    
    @State private var animated: Bool = false
    
    var body: some View {
        ScrollView {
            VStack(spacing: 10) {
                Text("There are no items")
                    .font(.title)
                    .fontWeight(.medium)
                    .foregroundColor(.secondary)
                Text("Click the add button and add a bunch of items to your todo list")
                    .font(.title3)
                    .fontWeight(.light)
                    .foregroundColor(.secondary)
                    .padding(.bottom)
                
                NavigationLink {
                    AddView()
                } label: {
                    Text("Add Your First Todo Item")
                        .foregroundColor(.white)
                        .font(.headline)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(Color.accentColor)
                        .cornerRadius(10)
                }
                .padding(.horizontal, animated ? 35 : 40)
                .shadow(color: animated ? .secondary.opacity(0.7): .secondary,
                        radius: animated ? 30 : 10)
                .scaleEffect(animated ? 1.099 : 1.0)
                .offset(y: animated ? 1 : 0)
            }
            .multilineTextAlignment(.center)
            .padding(40)
            .onAppear { addAnimation() }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    
    private func addAnimation() {
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.7) {
            withAnimation(.easeInOut(duration: 2.5).repeatForever()) { animated.toggle() }
        }
    }
}

struct NoItemsView_Previews: PreviewProvider {
    static var previews: some View {
        NoItemsView()
            .previewLayout(.sizeThatFits)
    }
}
