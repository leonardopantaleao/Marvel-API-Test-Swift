//
//  Comic.swift
//  MarvelAPI
//
//  Created by LEONARDO P S P LEAO on 02/05/23.
//

import Foundation
class Comic: Decodable {
    let title: String
    let issueNumber: Int
    let description: String
    let price: Price
    let thumbnail: Thumbnail
    private enum CodingKeys: String, CodingKey {
        case title
        case issueNumber
        case description
        case price
        case thumbnail
    }
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.title = try container.decode(String.self, forKey: .title)
        self.issueNumber = try container.decode(Int.self, forKey: .issueNumber)
        self.description = try container.decode(String.self, forKey: .description)
        self.price = try container.decode(Price.self, forKey: .price)
        self.thumbnail = try container.decode(Thumbnail.self, forKey: .thumbnail)
    }
}

class Price: Decodable {
    let type: String
    let price: Double
    private enum CodingKeys: String, CodingKey {
        case type
        case price
    }
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.type = try container.decode(String.self, forKey: .type)
        self.price = try container.decode(Double.self, forKey: .price)
    }
}

class Thumbnail: Decodable {
    let path: String
    private enum CodingKeys: String, CodingKey {
        case path
    }
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.path = try container.decode(String.self, forKey: .path)
    }
}
