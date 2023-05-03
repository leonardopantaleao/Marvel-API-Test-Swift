//
//  MarvelAPIClientTestDataMock.swift
//  MarvelAPI
//
//  Created by LEONARDO P S P LEAO on 02/05/23.
//

import Combine
import Foundation

class MarvelAPIClientTestDataMock: MarvelAPIClientProtocol {
    func fetchComics() -> Future<[Comic], Error> {
        return Future { promise in
            promise(.success(Comic.testData))
        }
    }
}
