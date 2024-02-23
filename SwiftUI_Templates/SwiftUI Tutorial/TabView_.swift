//
//  TabView_.swift
//  UIElementsProject
//
//  Created by PaulmaX on 1.02.23.
//

import SwiftUI

struct TabView_: View {
    
    @State var selectedTab: Int = 0
    
    let icons: [String] = ["figure.walk", "car", "tram", "bus"]
    
    var body: some View {
        VStack {
            Spacer()
            
            TabView(selection: $selectedTab) {
                HomeView(selectedTab: $selectedTab)
                    .tabItem {
                        Image(systemName: "house.fill")
                        Text("Home")
                    }
                    .tag(0)
                
                Text("Brouse TAB".uppercased())
                    .tabItem {
                        Image(systemName: "globe")
                        Text("Brouse")
                    }
                    .tag(1)
                
                Text("Settings TAB".uppercased())
                    .tabItem {
                        Image(systemName: "gear")
                        Text("Settings")
                    }
                    .tag(2)
            }
            .accentColor(.indigo)
            
            Spacer()
            
            TabView {
                ForEach(icons, id: \.self) {
                    Image(systemName: $0)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 200, height: 200)
                        .foregroundColor(.white)
                        .clipped()
                }
            }
            .background(
                RadialGradient(gradient: Gradient(colors: [.red, .teal]), center: .center, startRadius: 5, endRadius: 350)
            )
            .frame(height: 350)
            .tabViewStyle(.page(indexDisplayMode: .automatic))
            .indexViewStyle(.page(backgroundDisplayMode: .always))
            
            Spacer()
        }
    }
}

#if DEBUG
struct TabView__Previews: PreviewProvider { static var previews: some View { TabView_() } }
#endif

struct HomeView: View {
    
    @Binding var selectedTab: Int
    
    var body: some View {
        ZStack {
            Color.orange.ignoresSafeArea(SafeAreaRegions.all, edges: .top)
            VStack {
                Text("HOME TAB")
                    .font(.largeTitle)
                    .foregroundColor(.white)
                
                Button  {
                    selectedTab = 2
                } label: { Text("Go to Profile") }
                .buttonStyle(BorderedProminentButtonStyle())
            }
        }
    }
}
