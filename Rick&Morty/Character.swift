//
//  Character.swift
//  Rick&Morty
//
//  Created by javier pineda on 30/01/24.
//

import Foundation

struct Characters: Codable {
    let results: [Character]
}

struct Character: Codable {
    let id: Int
    let name: String
    let status: String
    let species: String
    let gender: String
    let image: String
    
    enum CodingKeys: CodingKey {
        case id
        case name
        case status
        case species
        case gender
        case image
    }
}
