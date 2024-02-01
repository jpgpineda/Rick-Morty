//
//  ApiError.swift
//  Rick&Morty
//
//  Created by javier pineda on 30/01/24.
//

import Foundation

enum ApiError: Error {
    case badUrl
    case requestFailed(description: String)
    case noData
    case jsonParsingFailure
    
    var customDescription: String {
        switch self {
        case .badUrl:
            return "Bad url sintaxis"
        case .requestFailed(let description):
            return "Request has failed: \(description)"
        case .noData:
            return "Response has no data"
        case .jsonParsingFailure:
            return "Json parse error"
        }
    }
}
