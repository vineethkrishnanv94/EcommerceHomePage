//
//  HomeDetail.swift
//  Ecommerce
//
//  Created by Vk on 06/02/22.
//

import Foundation
class HomeDetail :Decodable{

    var banner: Banner?
    var offers: [Offer]?
    var products: [Product]?
    enum CodingKeys: String, CodingKey {
        case banner
        case products
        case offers
    }
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        banner = try container.decodeIfPresent(Banner.self, forKey: .banner)
        offers = try container.decodeIfPresent([Offer].self, forKey: .offers)
        products = try container.decodeIfPresent([Product].self, forKey: .products)

    }
}
class Banner: Decodable {
    var bannerId: Int?
    var image: String?

    enum CodingKeys: String, CodingKey {
        case bannerId = "id"
        case image
    }
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.bannerId = try container.decodeIfPresent(Int.self, forKey: .bannerId)
        self.image = try container.decodeIfPresent(String.self, forKey: .image)
    }

}
class Offer: Decodable {
    var offerId: Int?
    var image: String?

    enum CodingKeys: String, CodingKey {
        case offerId = "id"
        case image
    }
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.offerId = try container.decodeIfPresent(Int.self, forKey: .offerId)
        self.image = try container.decodeIfPresent(String.self, forKey: .image)
    }

}

class Product: Decodable {
    var productId: Int?
    var offer: String?
    var name: String?
    var image: String?

    enum CodingKeys: String, CodingKey {
        case productId = "id"
        case image
        case name
        case offer
    }
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.productId = try container.decodeIfPresent(Int.self, forKey: .productId)
        self.image = try container.decodeIfPresent(String.self, forKey: .image)
        self.name = try container.decodeIfPresent(String.self, forKey: .name)
        self.offer = try container.decodeIfPresent(String.self, forKey: .offer)

    }

}
