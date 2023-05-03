//
//  MarvelAPIClient.swift
//  MarvelAPI
//
//  Created by LEONARDO P S P LEAO on 02/05/23.
//

import Alamofire
import Foundation
import Combine

protocol MarvelAPIClientProtocol {
    func fetchComics() -> Future<[Comic], Error>
}

class MarvelAPIClient: MarvelAPIClientProtocol {
    let apiKey = UserDefaults.standard.object(forKey: "publicKey") ?? ""
    let hash = UserDefaults.standard.object(forKey: "md5Hash") ?? ""
    let ts = Int(Date().timeIntervalSince1970 * 1000)
    let format = "comic"
    let formatType = "comic"
    let orderBy = "title"
    let apiUrl = "https://gateway.marvel.com/v1/public/comics"
    var parameters: Parameters {
        [
            "apikey": self.apiKey,
            "hash": MD5Hash.md5("\(self.ts)\(self.hash)\(self.apiKey)"),
            "ts": self.ts,
            "format": self.format,
            "formatType": self.formatType,
            "orderBy": self.orderBy
        ]
    }
    func fetchComics() -> Future<[Comic], Error> {
        return Future { promise in
            AF.request(self.apiUrl, method: .get, parameters: self.parameters, headers: .default)
                .responseDecodable(of: ComicResponse.self) { response in
                    switch response.result {
                    case .success(let value):
                        promise(.success(value.data.results))
                    case .failure(let error):
                        promise(.failure(error))
                    }
                }
        }
    }
}
