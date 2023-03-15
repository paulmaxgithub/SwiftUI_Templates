//
//  LocalFileManager.swift
//  SwiftUI_Elements_Templates
//
//  Created by PaulmaX on 14.03.23.
//

import SwiftUI

final class LocalFileManager {
    
    static let manage = LocalFileManager()
    
    private let folderName: String = "MyApp_Images"
    
    init() { createFolderIfNeeded() }
    
    //CREATE FOLDER
    func createFolderIfNeeded() {
        guard let path = FileManager.default
                .urls(for: .cachesDirectory, in: .userDomainMask)
                .first?
                .appendingPathComponent(folderName) else { return }
        
        if !FileManager.default.fileExists(atPath: path.path) {
            do {
                try FileManager.default.createDirectory(at: path, withIntermediateDirectories: true)
                print("Success Creating Derictory")
            } catch let error {
                fatalError(error.localizedDescription)
            }
        }
    }
    
    //DELETE FOLDER
    func deleteFolder() {
        guard let path = FileManager.default
                .urls(for: .cachesDirectory, in: .userDomainMask)
                .first?
                .appendingPathComponent(folderName) else { return }
        
        do {
            try FileManager.default.removeItem(at: path)
            print("Folder is deleted!")
        } catch let error {
            fatalError(error.localizedDescription)
        }
    }
    
    //SAVE IMAGE
    func saveImage(image: UIImage, name: String) -> String {
        guard let data = image.jpegData(compressionQuality: 1.0),
              let pathURL = getDerictoryPathImage(name) else { return "Error geting data" }
        
        do { try data.write(to: pathURL); return "Success Saving" }
        catch let error { return error.localizedDescription }
    }
    
    //GET IMAGE
    func getImage(name: String) -> UIImage? {
        guard let path = getDerictoryPathImage(name)?.path,
              FileManager.default.fileExists(atPath: path) else { return nil }
        return UIImage(contentsOfFile: path)
    }
    
    //DELETE IMAGE
    func deleteImage(name: String) -> String {
        guard let pathURL = getDerictoryPathImage(name),
              FileManager.default.fileExists(atPath: pathURL.path)
        else { return "Error deleting image" }
        
        do { try FileManager.default.removeItem(at: pathURL); return "Success Deleting" }
        catch let error { return error.localizedDescription }
    }
    
    private func getDerictoryPathImage(_ name: String) -> URL? {
        return FileManager.default
            .urls(for: .cachesDirectory, in: .userDomainMask)
            .first?
            .appendingPathComponent(folderName)
            .appendingPathComponent("\(name).jpeg")
    }
}
