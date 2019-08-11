//
//  KeysClient.swift
//  shopapp
//
//  Created by David on 8/10/19.
//  Copyright © 2019 David. All rights reserved.
//

import Foundation

class KeysClient: APIClient {
    
    static let shared = KeysClient()
    
    convenience init() {
        self.init(client: Client(), path: Config.baseAPI.value! + "")
    }
    
    func getKeys(success: @escaping ([Category]) -> Void) {
        get(endpoint: "/keys", success: success)
    }
    
    
}
