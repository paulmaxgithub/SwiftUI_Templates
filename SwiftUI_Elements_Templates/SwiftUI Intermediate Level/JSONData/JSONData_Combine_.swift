//
//  JSONData_Combine_.swift
//  SwiftUI_Elements_Templates
//
//  Created by PaulmaX on 11.03.23.
//

import SwiftUI
import Combine

final class JSONData_Combine_ViewModel: ObservableObject {
    
    @Published var posts: [PostModel] = []
    
    var cancellables = Set<AnyCancellable>()
    
    init() { getPosts() }
    
    private func getPosts() {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else { return }
        URLSession.shared.dataTaskPublisher(for: url)
//            .subscribe(on: DispatchQueue.global(qos: .background))
            .receive(on: DispatchQueue.main)
            .retry(5)
            .tryMap(tryMapDataTask)
            .decode(type: [PostModel].self, decoder: JSONDecoder())
            .replaceError(with: [])
            .sink(receiveValue: { [unowned self] _posts in
                posts = _posts
            })
            .store(in: &cancellables)
    }
    
    private func tryMapDataTask(output: URLSession.DataTaskPublisher.Output) throws -> Data {
        if let response = output.response as? HTTPURLResponse {
            switch response.statusCode {
            case 200..<300: print("Status Code: \(response.statusCode) ✅")
            case 400..<500: print("Status Code: \(response.statusCode) ❌")
            default: throw URLError(.badServerResponse)
            }
        }
        return output.data
    }
}

struct JSONData_Combine_: View {
    
    @StateObject var vm = JSONData_Combine_ViewModel()
    
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
