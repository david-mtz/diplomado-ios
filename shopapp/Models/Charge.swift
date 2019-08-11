//
//  ShopCart.swift
//  shopapp
//
//  Created by David on 8/10/19.
//  Copyright © 2019 David. All rights reserved.
//

import Foundation

struct Charge: Codable {
    let uidevice: String
    let data: String // Encoded data (ShopCartStruc)
}

struct ChargeData: Codable {
    let products: [Product]
    let amount: Float
    let creditCard: CreditCard
    let direction: Direction
}

extension ChargeData {
    func toJSON() -> String {
        do {
            let jsonData = try JSONEncoder().encode(self)
            guard let jsonString = String(data: jsonData, encoding: .utf8) else { return ""}
            print(jsonString)
            return jsonString
        } catch {
            return ""
        }
    }
}

struct CreditCard: Codable {
    let holder: String
    let number: String
    let monthExpiration: String
    let yearExpiration: String
}
