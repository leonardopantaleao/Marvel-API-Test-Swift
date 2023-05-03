//
//  MarvelAPIClient.swift
//  MarvelAPI
//
//  Created by LEONARDO P S P LEAO on 02/05/23.
//

import Foundation
import Combine

protocol MarvelAPIClientProtocol {
    func fetchComics() -> Future<[Comic], Error>
}

class MarvelAPIClient: MarvelAPIClientProtocol {
    func fetchComics() -> Future<[Comic], Error> {
        return Future { promise in
            promise(.success([]))
        }
    }
}
