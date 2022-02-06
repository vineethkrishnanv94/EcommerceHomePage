//
//  NetworkingConstants.swift
//  Ecommerce
//
//  Created by Vk on 06/02/22.
//

import Foundation
let BASEURL = "run.mocky.io/v3/"
struct NetworkingConstants {
    
    static let baseUrl =  getBaseUrl()
    
    static func getBaseUrl() -> String {
        return BASEURL
    }
}
