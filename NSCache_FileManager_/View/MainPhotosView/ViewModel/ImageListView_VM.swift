//
//  ImageListView_VM.swift
//  SwiftUI_Elements_Templates
//
//  Created by PaulmaX on 15.03.23.
//

import Foundation
import Combine

final class ImageListView_VM: ObservableObject {
    
    @Published var photoModelData: [PhotoModel] = []
 
    private let photoModelService = PhotoModelService.load
    
    private var cancellables = Set<AnyCancellable>()
    
    init() { addSubscribers() }
    
    private func addSubscribers() {
        photoModelService.$photoModel
            .sink { [unowned self] model in
                photoModelData = model
            }
            .store(in: &cancellables)
    }
}
