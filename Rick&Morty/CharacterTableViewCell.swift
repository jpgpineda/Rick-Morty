//
//  CharacterTableViewCell.swift
//  Rick&Morty
//
//  Created by javier pineda on 30/01/24.
//

import UIKit

class CharacterTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setup(character: Character) {
        titleLabel.text = character.name
    }
}
