//
//  NSCache_.swift
//  SwiftUI_Elements_Templates
//
//  Created by PaulmaX on 14.03.23.
//

import SwiftUI

final class CacheManager {
    
    static let manage = CacheManager()
    
    private init() {}
    
    //CREATE CACHE TO STORE DATA
    private var imageCache: NSCache<NSString, UIImage> = {
        let cache = NSCache<NSString, UIImage>()
        cache.countLimit = 3
        cache.totalCostLimit = (1024 * 1024 * 100) // 100mb
        return cache
    }()
    
    func add(image: UIImage, name: String) {
        imageCache.setObject(image, forKey: name as NSString)
        print("Added to Cache")
    }
    
    func remove(name: String) {
        imageCache.removeObject(forKey: name as NSString)
        print("Remove from Cache")
    }
    
    func get(name: String) -> UIImage? {
        if let image = imageCache.object(forKey: name as NSString) {
            print("Got from Cache")
            return image
        } else {
            print("No Data")
            return nil
        }
    }
}

final class Cache_VM: ObservableObject {
    
    @Published var startingImage: UIImage? = nil
    
    public let imageName: String = "wwdc"
    
    private let manager = CacheManager.manage
    
    init() {}
    
    private func getImageFromAssetsFolder() -> UIImage? {
        UIImage(named: imageName)
    }
    
    public func addToCache() {
        guard let image = getImageFromAssetsFolder() else { return }
        manager.add(image: image, name: imageName)
    }
    
    public func removeFromCache() {
        manager.remove(name: imageName)
    }
    
    public func getFromCache() {
        startingImage = manager.get(name: imageName)
    }
}

struct NSCache_: View {
    
    @StateObject var vm = Cache_VM()
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Image(vm.imageName)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 150, height: 150)
                        .clipped()
                        .cornerRadius(10)
                    Image(uiImage: vm.startingImage ?? UIImage(systemName: "xmark.seal")!)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 150, height: 150)
                        .clipped()
                        .cornerRadius(10)
                }
                .padding()
                
                HStack {
                    Button  {
                        vm.addToCache()
                    } label: {
                        Text("SAVE TO CACHE")
                            .foregroundColor(.white)
                            .font(.headline)
                            .fontWeight(.semibold)
                            .frame(maxWidth: .infinity)
                            .frame(maxHeight: .infinity)
                            .padding()
                            .background(Color.purple.cornerRadius(10))
                    }
                    Button  {
                        vm.removeFromCache()
                    } label: {
                        Text("DELETE FROM CACHE")
                            .foregroundColor(.white)
                            .font(.headline)
                            .fontWeight(.semibold)
                            .frame(maxWidth: .infinity)
                            .frame(maxHeight: .infinity)
                            .padding()
                            .background(Color.purple.cornerRadius(10))
                    }
                    Button  {
                        vm.getFromCache()
                    } label: {
                        Text("GET FROM CACHE")
                            .foregroundColor(.white)
                            .font(.headline)
                            .fontWeight(.semibold)
                            .frame(maxWidth: .infinity)
                            .frame(maxHeight: .infinity)
                            .padding()
                            .background(Color.purple.cornerRadius(10))
                    }
                }
                .fixedSize(horizontal: false, vertical: true)
                .padding(.horizontal)
                Spacer()
            }
            .navigationTitle("Image in Cache".uppercased())
        }
    }
}

struct NSCache__Previews: PreviewProvider {
    static var previews: some View {
        NSCache_()
    }
}
