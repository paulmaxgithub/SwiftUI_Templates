//
//  ImageRowView.swift
//  SwiftUI_Elements_Templates
//
//  Created by PaulmaX on 15.03.23.
//

import SwiftUI

struct ImageRowView: View {
    
    let model: PhotoModel
    
    var body: some View {
        HStack {
            RowImage(urlString: model.thumbnailUrl, key: model.id.description)
                .frame(width: 50, height: 50)
                .padding(.trailing, 8)
            VStack(alignment: .leading, spacing: 8) {
                Text(model.title)
                    .font(.headline)
                Text(model.thumbnailUrl)
                    .foregroundColor(.gray)
                    .italic()
            }
        }
    }
}
