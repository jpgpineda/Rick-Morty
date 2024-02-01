//
//  ViewController.swift
//  Rick&Morty
//
//  Created by javier pineda on 30/01/24.
//

import UIKit
import Foundation

class ViewController: UIViewController {
    @IBOutlet weak var charactersTable: UITableView!
    var characters: [Character] = []
    var viewModel: ViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = ViewModelImplementation(view: self)
        viewModel?.getCharacters()
        charactersTable.registerCell("CharacterTableViewCell")
        charactersTable.dataSource = self
    }
}

extension ViewController: ViewModelView {
    func showErrorAlert(message: String) {
        showFailureAlert(message: message)
    }
    
    func updateContent(characters: [Character]) {
        DispatchQueue.main.async {
            self.characters = characters
            self.charactersTable.reloadData()
        }
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return characters.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CharacterTableViewCell", for: indexPath) as? CharacterTableViewCell else { return UITableViewCell() }
        cell.setup(character: characters[indexPath.row])
        return cell
    }
}

