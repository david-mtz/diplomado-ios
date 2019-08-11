//
//  DataContainer.swift
//  shopapp
//
//  Created by David on 8/11/19.
//  Copyright © 2019 David. All rights reserved.
//

import Foundation

enum DataContainer {
    
    case permanent
    case cache
    
    var baseUrl: URL {
        switch self {
        case .cache:
            return StorageType.cache.url
        case .permanent:
            return StorageType.permanent.url
        }
    }
    
    
    func fileUrl(for filename: String) -> URL? {
        var fileUrl = baseUrl
        fileUrl.appendPathComponent(filename)
        return fileUrl
    }
    
    func load(filename: String) -> Data? {
        guard let url = fileUrl(for: filename) else {
            print("Unable to load url")
            return nil
        }
        return try? Data(contentsOf: url)
    }
    
    func save(data: Data, in filename: String) -> Bool {
        guard let url = fileUrl(for: filename) else {
            print("Unable to load url")
            return false
        }
        do {
            try data.write(to: url)
            return true
        } catch let err {
            print("Uable to write in disk: \(err.localizedDescription)")
            return false
        }
    }
    
}
