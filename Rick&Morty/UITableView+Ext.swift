//
//  UITableView+Ext.swift
//  Rick&Morty
//
//  Created by javier pineda on 30/01/24.
//

import UIKit

extension UITableView {
    func registerCell(_ identifier: String) {
        self.register(UINib(nibName: identifier, bundle: nil), forCellReuseIdentifier: identifier)
    }
}
