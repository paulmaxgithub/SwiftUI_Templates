//
//  PhotoFileManager.swift
//  SwiftUI_Elements_Templates
//
//  Created by PaulmaX on 16.03.23.
//

import Foundation
import UIKit

final class PhotoFileManager {
    
    static let file = PhotoFileManager()
    private init() { createFolderIfNeeded() }
    
    private let folderName = "downloaded_photos"
    
    private func createFolderIfNeeded() {
        guard let url = getFolderPath() else { return }
        
        if !(FileManager.default.fileExists(atPath: url.path)) {
            do {
                try FileManager.default.createDirectory(at: url, withIntermediateDirectories: true)
            } catch let error {
                fatalError(error.localizedDescription)
            }
        }
    }
    
    private func getFolderPath() -> URL? {
        return FileManager.default
            .urls(for: .cachesDirectory, in: .userDomainMask)
            .first?
            .appendingPathComponent(folderName)
    }
    
    private func getImagePath(key: String) -> URL? {
        guard let folder = getFolderPath() else { return nil }
        return folder.appendingPathComponent(key + ".png")
    }
    
    
    func addImageToFolder(key: String, value: UIImage) {
        guard let data = value.pngData(),
        let url = getImagePath(key: key)
        else { return }
        
        do {
            try data.write(to: url)
        } catch let error {
            fatalError(error.localizedDescription)
        }
    }
    
    func getImageFromFolder(key: String) -> UIImage? {
        guard let url = getImagePath(key: key),
              FileManager.default.fileExists(atPath: url.path)
        else { return nil }
        
        return UIImage(contentsOfFile: url.path)
    }
}
