//
//  AsyncImage_.swift
//  UIElementsProject
//
//  Created by PaulmaX on 6.02.23.
//

import SwiftUI

struct AsyncImage_: View {
    
    let url = URL(string: "https://picsum.photos/500")
    let badURL = URL(string: "https://.photos/500")
    
    var body: some View {
        VStack {
            
            Spacer()
            
            AsyncImage(url: url) { image in
                image.resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200)
                    .cornerRadius(20)
                    .shadow(radius: 10)
            } placeholder: {
                ProgressView()
            }
            
            Spacer(minLength: 40)
            
            AsyncImage(url: badURL) { phase in
                switch phase {
                case .empty: ProgressView()
                case .success(let image):
                    image.resizable()
                        .scaledToFit()
                        .frame(width: 200, height: 200)
                        .cornerRadius(20)
                        .shadow(radius: 10)
                case .failure(let error):
                    VStack(alignment: .center) {
                        Image(systemName: "network.badge.shield.half.filled")
                            .resizable()
                            .scaledToFit()
                            .font(.largeTitle)
                            .frame(width: 100, height: 100)
                        Text("\(error.localizedDescription)")
                            .multilineTextAlignment(.center)
                            .padding()
                    }.padding()
                @unknown default:
                    fatalError()
                }
            }
            
            Spacer()
        }
    }
}

struct AsyncImage_Previews: PreviewProvider {
    static var previews: some View {
        AsyncImage_()
    }
}
