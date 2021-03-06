//
//  UITableViewExtension.swift
//  WBooks
//
//  Created by Nacho 2 on 07/05/2020.
//  Copyright © 2020 Wolox. All rights reserved.
//

import UIKit

extension UITableView {

    func setEmptyMessage(_ message: String) {
        let messageLabel = UILabel(frame: CGRect(x: 0, y: 0, width: bounds.size.width, height: bounds.size.height))
        messageLabel.text = message
        messageLabel.textColor = .black
        messageLabel.numberOfLines = 0
        messageLabel.textAlignment = .center
        messageLabel.sizeToFit()
        backgroundView = messageLabel
    }

    func restore() {
        backgroundView = nil
    }
}
