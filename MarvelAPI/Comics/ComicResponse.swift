//
//  ComicResponse.swift
//  MarvelAPI
//
//  Created by LEONARDO P S P LEAO on 03/05/23.
//

struct ComicResponse: Decodable {
    let code: Int
    let status: String
    let data: ComicData
}

struct ComicData: Decodable {
    let count: Int
    let results: [Comic]
}

struct Comic: Decodable, Identifiable {
    let id: Int
    let title: String
    let description: String?
    let issueNumber: Int
    let prices: [Price]
    let thumbnail: Thumbnail
    public static var testData: [Comic] {
        [
            Comic(
                id: 1,
                title: "100th Anniversary Special (2014) #1",
                // swiftlint:disable line_length
                description: "It's 100 years after the wall-crawler&#39;s creation, but when the Kingpin has taken Spider-Man's ultra-powerful techno-symbiote suit, Spider-Man will need to prove once again why he is the world's greatest super hero.", issueNumber: 1,
                // swiftlint:enable line_length
                prices: [
                    Price(type: "printPrice", price: 3.99),
                    Price(type: "digitalPurchasePrice", price: 3.99)
                ],
                thumbnail: Thumbnail(path: "https://i.annihil.us/u/prod/marvel/i/mg/c/20/53b1be72eec81.jpg",
                                     extension: "jpg")
            ),
            Comic(
                id: 2,
                title: "1602 Witch Hunter Angela (2015) #3",
                // swiftlint:disable line_length
                description: "\"IN WHICH HEARTS REND AND HEADS ROLL\" Enchantress's prophecy strangles Angela and Sera from all sides when they are forced to ride hell (and a few other realms, too) for leather to the distant coast. In a haunted castle, a tormented witchbreed girl named Anna Maria - a.k.a. the 1602 Rogue - makes a deadly deal - with a shocking price! Kieron and Frazer Irving bring to life the first tale Angela tells that is her very own - as the forces of Faerie close in!", issueNumber: 3,
                // swiftlint:enable line_length
                prices: [
                    Price(type: "printPrice", price: 3.99),
                    Price(type: "digitalPurchasePrice", price: 3.99)
                ],
                thumbnail: Thumbnail(path: "https://i.annihil.us/u/prod/marvel/i/mg/d/40/55e4919600061.jpg",
                                     extension: "jpg")
            )
        ]
    }
}


struct Price: Decodable {
    let type: String
    let price: Double
}

struct Thumbnail: Decodable {
    let path: String
    let `extension`: String
}

