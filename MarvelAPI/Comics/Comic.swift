//
//  Comic.swift
//  MarvelAPI
//
//  Created by LEONARDO P S P LEAO on 02/05/23.
//

import Foundation
class Comic: Decodable, Identifiable {
    let id = UUID()
    let title: String
    let issueNumber: Int
    let description: String
    let prices: [Price]
    let thumbnail: Thumbnail
    private enum CodingKeys: String, CodingKey {
        case title
        case issueNumber
        case description
        case prices
        case thumbnail
    }
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.title = try container.decode(String.self, forKey: .title)
        self.issueNumber = try container.decode(Int.self, forKey: .issueNumber)
        self.description = try container.decode(String.self, forKey: .description)
        self.prices = try container.decode([Price].self, forKey: .prices)
        self.thumbnail = try container.decode(Thumbnail.self, forKey: .thumbnail)
    }
    private init(
        title: String,
        issueNumber: Int,
        description: String,
        prices: [Price],
        thumbnail: Thumbnail
    ) {
        self.title = title
        self.issueNumber = issueNumber
        self.description = description
        self.prices = prices
        self.thumbnail = thumbnail
    }
    public static var testData: [Comic] {
        [
            Comic(
                title: "100th Anniversary Special (2014) #1",
                issueNumber: 1,
                // swiftlint:disable line_length
                description: "It's 100 years after the wall-crawler&#39;s creation, but when the Kingpin has taken Spider-Man's ultra-powerful techno-symbiote suit, Spider-Man will need to prove once again why he is the world's greatest super hero.",
                // swiftlint:enable line_length
                prices: [
                    Price(type: "printPrice", price: 3.99),
                    Price(type: "digitalPurchasePrice", price: 3.99)
                    ],
                thumbnail: Thumbnail(path: "http://i.annihil.us/u/prod/marvel/i/mg/c/20/53b1be72eec81.jpg")
            ),
            Comic(
                title: "1602 Witch Hunter Angela (2015) #3",
                issueNumber: 3,
                // swiftlint:disable line_length
                description: "\"IN WHICH HEARTS REND AND HEADS ROLL\" Enchantress's prophecy strangles Angela and Sera from all sides when they are forced to ride hell (and a few other realms, too) for leather to the distant coast. In a haunted castle, a tormented witchbreed girl named Anna Maria - a.k.a. the 1602 Rogue - makes a deadly deal - with a shocking price! Kieron and Frazer Irving bring to life the first tale Angela tells that is her very own - as the forces of Faerie close in!",
                // swiftlint:enable line_length
                prices: [
                    Price(type: "printPrice", price: 3.99),
                    Price(type: "digitalPurchasePrice", price: 3.99)
                    ],
                thumbnail: Thumbnail(path: "http://i.annihil.us/u/prod/marvel/i/mg/d/40/55e4919600061.jpg")
            )
        ]
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
    internal init(type: String, price: Double) {
        self.type = type
        self.price = price
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
    internal init(path: String) {
        self.path = path
    }
}
