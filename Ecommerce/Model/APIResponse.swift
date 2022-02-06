//
//  APIResponse.swift
//  Ecommerce
//
//  Created by Vk on 06/02/22.
//

import Foundation
struct APIResponse<T: Decodable>: Decodable {
    var code: Int
    var message: String
    var data: T?
    
    private enum CodingKeys: String, CodingKey {
        case code
        case message = "msg"
        case data
    }
}
