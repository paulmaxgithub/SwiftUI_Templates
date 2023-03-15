//
//  PhotoCacheManager.swift
//  SwiftUI_Elements_Templates
//
//  Created by PaulmaX on 16.03.23.
//

import UIKit

final class PhotoCacheManager {
    
    static let cache = PhotoCacheManager()
    private init() {}
    
    private var photoCache: NSCache<NSString, UIImage> = {
       let cache = NSCache<NSString, UIImage>()
        cache.countLimit = 200
        cache.totalCostLimit = 1024 * 1024 * 200 //200mb
        return cache
    }()
    
    public func add(key: String, value: UIImage) {
        photoCache.setObject(value, forKey: key as NSString)
    }
    
    public func get(key: String) -> UIImage? {
        return photoCache.object(forKey: key as NSString)
    }
}
