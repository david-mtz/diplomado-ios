//
//  CodableStorage.swift
//  shopapp
//
//  Created by David on 8/11/19.
//  Copyright © 2019 David. All rights reserved.
//

import Foundation
import Foundation

class CodableStorage<T> where T: Codable {
    let filename: String
    let dataContainer = DataContainer.permanent
    
    init(filename: String) {
        self.filename = filename
    }
    
    func load() -> T? {
        guard let data = dataContainer.load(filename: filename) else {
            return nil
        }
        do {
            return try JSONDecoder().decode(T.self, from: data)
        } catch let err {
            print("Could not decode data: \(err.localizedDescription)")
            return nil
        }
    }
    
    func save(data dataSource: T) -> Bool {
        guard let data = try? JSONEncoder().encode(dataSource) else {
            return false
        }
        return dataContainer.save(data: data, in: filename)
    }
}
