//
//  PhotoModelService.swift
//  SwiftUI_Elements_Templates
//
//  Created by PaulmaX on 15.03.23.
//

import Foundation
import Combine

final class PhotoModelService {
    
    static let load = PhotoModelService()
    private init() { downloadData() }
    
    @Published var photoModel: [PhotoModel] = []
    
    private var cancellables = Set<AnyCancellable>()
    
    private func downloadData() {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/photos") else { return }
        
        URLSession.shared.dataTaskPublisher(for: url)
            .subscribe(on: DispatchQueue.global(qos: .background))
            .receive(on: DispatchQueue.main)
            .tryMap(handleOutput)
            .decode(type: [PhotoModel].self, decoder: JSONDecoder())
            .sink { completion in
                switch completion {
                case .failure(let error): fatalError(error.localizedDescription)
                case .finished: break
                }
            } receiveValue: { [unowned self] model in
                photoModel = model
            }
            .store(in: &cancellables)

    }
    
    private func handleOutput(output: URLSession.DataTaskPublisher.Output) throws -> Data  {
        guard let response = output.response as? HTTPURLResponse,
              response.statusCode >= 200 && response.statusCode < 300 else {
                  throw URLError(.badServerResponse)
              }
        return output.data
    }
}
