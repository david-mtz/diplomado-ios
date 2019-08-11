//
//  ChargeStorage.swift
//  shopapp
//
//  Created by David on 8/11/19.
//  Copyright © 2019 David. All rights reserved.
//

import Foundation

/// Class for save transactions in storage
class TransactionStorage: CodableStorage<[TransactionStored]> {
    static let shared = TransactionStorage()
    
    init() {
        super.init(filename: "transactions.json")
    }
    
}
