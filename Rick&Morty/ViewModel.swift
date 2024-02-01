//
//  ViewModel.swift
//  Rick&Morty
//
//  Created by javier pineda on 30/01/24.
//

import Foundation

protocol ViewModelView {
    func showErrorAlert(message: String)
    func updateContent(characters: [Character])
}

protocol ViewModel {
    var view: ViewModelView { get set }
    func getCharacters()
}

class ViewModelImplementation: ViewModel {
    var view: ViewModelView
    
    init(view: ViewModelView) {
        self.view = view
    }
    
    func getCharacters() {
        Task.init {
            do {
                let characters = try await CharacterApiClient().getCharacters()
                view.updateContent(characters: characters)
            } catch {
                guard let apiError = error as? ApiError else {
                    view.showErrorAlert(message: error.localizedDescription)
                    return
                }
                view.showErrorAlert(message: apiError.customDescription)
            }
        }
    }
}
