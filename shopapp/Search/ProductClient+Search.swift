//
//  ProductClient+Search.swift
//  shopapp
//
//  Created by David on 8/4/19.
//  Copyright © 2019 David. All rights reserved.
//

import Foundation


extension ProductClient {
    
    func search(query: [String: String], success: @escaping ([Product]) -> Void) {
        get(endpoint: "/product/search", queryItems: query, success: success)
    }

}
