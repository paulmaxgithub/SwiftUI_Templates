//
//  CustomDataTypes_.swift
//  UIElementsProject
//
//  Created by PaulmaX on 1.02.23.
//

import SwiftUI

struct UserModel: Identifiable {
    var id = UUID()
    let fullname: String
    let username: String
    let followerCount: Int
    let isVerified: Bool
}

struct CustomDataTypes_: View {
    
    @State private var users: [UserModel] = [
        UserModel(fullname: "Nick", username: "nick123", followerCount: 120, isVerified: true),
        UserModel(fullname: "Samantha", username: "samOK", followerCount: 500, isVerified: false),
        UserModel(fullname: "Emily", username: "Moly_Smoly", followerCount: 20, isVerified: false),
        UserModel(fullname: "Boris", username: "BoBo", followerCount: 1400, isVerified: true)
    ]
    
    var body: some View {
        NavigationView {
            List {
                ForEach(users) { user in
                    HStack(spacing: 15.0) {
                        Circle()
                            .stroke()
                            .foregroundColor(.gray)
                        
                            .frame(width: 40, height: 40)
                        
                        VStack(alignment: .leading) {
                            Text("\(user.fullname)")
                                .padding(.bottom, 1)
                            Text("@\(user.username)")
                                .foregroundColor(.secondary)
                                .font(.caption2)
                        }
                        Spacer()
                        
                        if user.isVerified {
                            Image(systemName: "checkmark.shield.fill")
                                .foregroundColor(.green)
                        } else {
                            Text("not confirmed")
                                .foregroundColor(.orange)
                                .font(.caption2)
                                .multilineTextAlignment(.trailing)
                                .lineLimit(1)
                        }
                        VStack {
                            Text(String(user.followerCount))
                                .bold()
                            Text("followers")
                                .foregroundColor(.secondary)
                                .font(.caption2)
                        }
                        
                    }
                    .padding(.vertical, 10)
                }
            }
            .listStyle(.insetGrouped)
            .navigationTitle("USERS")
        }
    }
}

struct CustomDataTypes_Previews: PreviewProvider {
    static var previews: some View {
        CustomDataTypes_()
    }
}
