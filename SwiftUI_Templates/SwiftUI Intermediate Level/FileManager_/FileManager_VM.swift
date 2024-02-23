//
//  FileManager_VM.swift
//  SwiftUI_Elements_Templates
//
//  Created by PaulmaX on 14.03.23.
//

import SwiftUI

final class FileManager_VM: ObservableObject {
    
    @Published var image: UIImage? = nil
    @Published var infoMessage: String = ""
    
    let manager = LocalFileManager.manage
    
    private let imageName = "wwdc"
    
    init() { getImageFromAssetsFolder() }
    
    private func getImageFromAssetsFolder() {
        image = UIImage(named: imageName)
    }
    
    //SAVE IMAGE
    public func saveImageToFileManager() {
        guard let image = image else { return }
        infoMessage = manager.saveImage(image: image, name: imageName)
    }
    
    //GET IMAGE
    public func getImageFromFileManager() {
        image = manager.getImage(name: imageName)
    }
    
    //DELETE IMAGE
    public func deleteImageFromFileManager() {
        infoMessage = manager.deleteImage(name: imageName)
        manager.deleteFolder()
    }
}
