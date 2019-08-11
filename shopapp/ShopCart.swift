//
//  ShopCart.swift
//  shopapp
//
//  Created by David on 7/24/19.
//  Copyright © 2019 David. All rights reserved.
//

import Foundation

class ShopCart {
    
    static let shared = ShopCart()
    
    var products: [Product] = [Product]()
    var directions: [Direction] = [Direction]()
    var purchased: [TransactionStored] = [TransactionStored]()

    init() {
    }
    
    func loadStorages() {
        directions = DirectionStorage.shared.load() ?? [Direction]()
        purchased = TransactionStorage.shared.load()  ?? [TransactionStored]()
        
    }
    
    func saveDirectionStorage() {
        DirectionStorage.shared.save(data: directions)
    }
    
    func saveTransactionStorage() {
        TransactionStorage.shared.save(data: purchased)
    }
    
}
