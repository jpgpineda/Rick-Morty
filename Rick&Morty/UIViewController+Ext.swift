//
//  UIViewController+Ext.swift
//  Rick&Morty
//
//  Created by javier pineda on 30/01/24.
//

import UIKit

extension UIViewController {
    func showFailureAlert(message: String) {
        let alert = UIAlertController(title: "Ups!", message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}
