//
//  StarRatingMask_.swift
//  SwiftUI_Elements_Templates
//
//  Created by PaulmaX on 22.02.23.
//

import SwiftUI

struct StarRatingMask_: View {
    
    @State var rating: Int = 2
    
    var body: some View {
        VStack {
            starsRatingView
            starsRatingView.overlay(overlayView)
        }
    }
    
    ///STARS RATING VIEW
    private var starsRatingView: some View {
        HStack {
            ForEach(1..<6) { index in
                Image(systemName: "star.fill")
                    .font(.largeTitle)
                    .foregroundColor(rating >= index ? .orange : .gray)
                    .onTapGesture { withAnimation(.linear(duration: 0.2)) { rating = index } }
            }
        }
    }
    
    ///OVERLAY VIEW
    private var overlayView: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                Rectangle()
                    .fill(LinearGradient(gradient: Gradient(colors: [.gray, .red]),
                                         startPoint: .leading, endPoint: .trailing))
                    .frame(width: CGFloat(rating) / 5 * geometry.size.width)
            }
        }
        .mask(starsRatingView)
        .allowsHitTesting(false)
    }
}

struct Mask__Previews: PreviewProvider {
    static var previews: some View {
        StarRatingMask_()
    }
}
