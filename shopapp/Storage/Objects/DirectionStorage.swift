//
//  DirectionStorage.swift
//  shopapp
//
//  Created by David on 8/11/19.
//  Copyright © 2019 David. All rights reserved.
//

import Foundation


/// Class for save directions in storage
class DirectionStorage: CodableStorage<[Direction]> {
    static let shared = DirectionStorage()
    
    init() {
        super.init(filename: "directions.json")
    }
    
}
