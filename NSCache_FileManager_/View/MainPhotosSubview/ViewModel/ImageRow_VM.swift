//
//  ImageRow_VM.swift
//  SwiftUI_Elements_Templates
//
//  Created by PaulmaX on 15.03.23.
//

import UIKit
import Combine

final class ImageRow_VM: ObservableObject {
    
    @Published var image: UIImage? = nil
    @Published var isLoading: Bool = false
    
    private let manager = PhotoCacheManager.cache
    
    private let urlString: String
    private let imageKey: String
    
    private var cancelables = Set<AnyCancellable>()
    
    init(url: String, key: String) {
        urlString = url
        imageKey = key
        getImageIfNeeded()
    }
    
    private func getImageIfNeeded() {
        if let savedImage = manager.get(key: imageKey) {
            image = savedImage
        } else {
            downloadImage()
        }
    }
    
    private func downloadImage() {
        isLoading = true
        guard let url = URL(string: urlString) else { isLoading = false; return }
        URLSession.shared.dataTaskPublisher(for: url)
            .map { UIImage(data: $0.data) }
            .receive(on: DispatchQueue.main)
            .sink { [unowned self] _ in
                isLoading = false
            } receiveValue: { [unowned self] imageResult in
                guard let _image = imageResult else { return }
                manager.add(key: imageKey, value: _image)
            }
            .store(in: &cancelables)
    }
}
