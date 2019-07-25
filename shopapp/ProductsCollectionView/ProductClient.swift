//
//  ProductClient.swift
//  shopapp
//
//  Created by David on 7/23/19.
//  Copyright © 2019 David. All rights reserved.
//

import Foundation

class ProductClient: APIClient {
    
    static let shared = ProductClient()

    convenience init() {
        self.init(client: Client(), path: Config.baseAPI.value! + "")
    }
    
    func list(success: @escaping ([Product]) -> Void) {
        get(endpoint: "/product", success: success)
    }
    

    func category(categoryId: Int, success: @escaping ([Product]) -> Void) {
        get(endpoint: "/product/category/\(categoryId)", success: success)
    }
    
    func listThumbnails(productId: Int, success: @escaping ([Thumbnail]) -> Void) {
        get(endpoint: "/product/gallery/\(productId)", success: success)
    }

}
