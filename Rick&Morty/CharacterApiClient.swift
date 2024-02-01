//
//  CharacterApiClient.swift
//  Rick&Morty
//
//  Created by javier pineda on 30/01/24.
//

import Foundation

protocol CharacterProtocol {
    func getCharacters() async throws -> [Character]
}

class CharacterApiClient: CharacterProtocol {
    func getCharacters() async throws -> [Character] {
        let response: Characters = try await ApiRequestDispatcher.request(apiRouter: .characters)
        return response.results
    }
}
