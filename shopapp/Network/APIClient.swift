//
//  APIClient.swift
//  SuperShop
//
//  Created by David on 5/7/19.
//  Copyright © 2019 David. All rights reserved.
//

import Foundation

class APIClient {
    let client: Client
    let path: String
    
    init(client: Client, path: String) {
        self.client = client
        self.path = path
    }
    
    func get<T>(endpoint:String, success: @escaping (T) -> Void) where T:Codable {
        request("GET", path: "\(path)\(endpoint)", payload: nil, success: success, errorHandler: nil)
    }
    
    private func request<T>(_ method: String, path: String, payload: T?, success: @escaping (T) -> Void, errorHandler: errorHandler?) where T:Codable {
        request(method, path: path, queryItems: nil, payload: payload, success: success, errorHandler: errorHandler)
    }
    
    private func request<T: Codable, Q: Codable>(_ method: String, path: String, queryItems: [String: String]?, payload: Q?, success: @escaping (T) -> Void, errorHandler: errorHandler?) {
        let data = encode(payload: payload)
        client.request(method, path: path, queryItems: queryItems, body: data, completionHandler: { (response, data) in
            guard response.successful() else { return }
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            do {
                guard let data = data else { print("Empty response"); return }
                let json = try decoder.decode(JSONResponse<T>.self, from: data)
                //print("===================================================================")
                success(json.data)
            } catch let err {
                //print(path)
                print("Unable to parse successfull response: \(err.localizedDescription)")
                errorHandler?(err)
            }
        }, errorHandler: errorHandler)
    }
    
    
    private func encode<T>(payload: T?) -> Data? where T:Codable {
        guard let payload = payload else { return nil }
        let encoder = JSONEncoder()
        encoder.keyEncodingStrategy = .convertToSnakeCase
        return try? encoder.encode(payload)
    }
    
    
}
