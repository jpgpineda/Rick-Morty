//
//  ApiRouter.swift
//  Rick&Morty
//
//  Created by javier pineda on 30/01/24.
//

import Foundation

enum ApiRouter {
    case characters
    
    var host: String {
        return "https://rickandmortyapi.com/api"
    }
    
    var path: String {
        switch self {
        case .characters:
            return "/character"
        }
    }
    
    var stringUrl: String {
        switch self {
        case .characters:
            return host + path
        }
    }
    
    var method: String {
        switch self {
        case .characters:
            return HttpMethod.GET
        }
    }
    
    var body: Data? {
        switch self {
        case .characters:
            return nil
        }
    }
}
