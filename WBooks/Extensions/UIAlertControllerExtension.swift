//
//  UIAlertControllerExtension.swift
//  WBooks
//
//  Created by Nacho 2 on 30/04/2020.
//  Copyright © 2020 Wolox. All rights reserved.
//

import UIKit

extension UIAlertController {
    func createErrorAlert(title: String? = nil, message: String = "") -> UIAlertController {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        return alert
    }
}
