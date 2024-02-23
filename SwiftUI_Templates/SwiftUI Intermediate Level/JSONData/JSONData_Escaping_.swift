//
//  JSONData_Escaping_.swift
//  SwiftUI_Elements_Templates
//
//  Created by PaulmaX on 11.03.23.
//

import SwiftUI

struct PostModel: Identifiable, Codable {
    let userId: Int
    let id:     Int
    let title:  String
    let body:   String
}

final class JSONData_Escaping_ViewModel: ObservableObject {
    
    @Published var posts: [PostModel] = []
    
    init() { getPosts() }
    
    private func getPosts() {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else { return }
        downloadData(fromURL: url) { data in
            guard let data = data else { return }
            DispatchQueue.main.async { [unowned self] in
                do {
                    posts = try JSONDecoder().decode([PostModel].self, from: data)
                } catch let error {
                    print(error.localizedDescription)
                }
            }
        }
    }
    
    private func downloadData(fromURL url: URL, completion: @escaping (_ data: Data?) -> Void) {
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if error == nil {
                if let response = response as? HTTPURLResponse {
                    switch response.statusCode {
                    case 200..<300: print("Status Code: \(response.statusCode) ✅")
                    case 400..<500: print("Status Code: \(response.statusCode) ❌")
                    default: print("Other from List of HTTP status codes")
                    }
                }
                guard let data = data else { return }
                completion(data)
            } else {
                completion(nil)
                print("ERROR ⚠️ - \(String(describing: error?.localizedDescription))")
            }
        }.resume()
    }
}

struct JSONData_Escaping_: View {
    
    @StateObject var vm = JSONData_Escaping_ViewModel()
    
    var body: some View {
        List {
            ForEach(vm.posts) { post in
                VStack(alignment: .leading, spacing: 10) {
                    Text("USER_ID: \(post.userId)".uppercased())
                        .font(.footnote)
                    Text(post.title.uppercased())
                        .font(.title2)
                        .bold()
                    Text(post.body)
                        .font(.title3)
                        .fontWeight(.thin)
                }
            }
        }
    }
}
