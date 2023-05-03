//
//  MarvelAPIClientError.swift
//  MarvelAPI
//
//  Created by LEONARDO P S P LEAO on 03/05/23.
//

import Foundation

enum MarvelAPIClientError: Error {
    case apiError
}

extension MarvelAPIClientError: CustomStringConvertible {
    public var description: String {
        switch self {
        case .apiError:
            return "Error! Check if you have entered the right public key and md5 hash."
        }
    }
}
