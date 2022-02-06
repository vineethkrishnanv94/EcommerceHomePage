//
//  Router.swift
//  Ecommerce
//
//  Created by Vk on 06/02/22.
//

import Foundation
enum Router {
    
    // 1.
    case getHomePageDetails

    private var scheme: String {
        return "https://"
    }
    
    private var host: String {
        return scheme + NetworkingConstants.baseUrl
        
    }
    
    var path: String {
        switch self {
        case .getHomePageDetails:
            return host + "7fafb9ef-32ad-4c68-a88e-de9bcb827a13"

        }
        
    }
    
    var method: String {
        switch self {

        case .getHomePageDetails:
            return "GET"

        }
    }

}
