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
    
    init() {
        directions.append(Direction(alias: "Casa", avenue: "Av. Tepetlapa", outdoorNumber: "30B", interiorNumber: "21", zp: "04800", colony: "Alianza popular revolucionaria", town: "Ciudad de México", state: "Ciudad de México", phone: "5531056094"))
    }
    
    
}
