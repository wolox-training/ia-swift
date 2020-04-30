//
//  UIStackViewExtension.swift
//  WBooks
//
//  Created by Nacho 2 on 30/04/2020.
//  Copyright © 2020 Wolox. All rights reserved.
//

import UIKit

extension UIStackView {
    func applyCardStyle(backgroundColor: UIColor) {
        let subView = UIView(frame: bounds)
        subView.backgroundColor = backgroundColor
        subView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        insertSubview(subView, at: 0)
        subView.layer.cornerRadius = 5
        subView.layer.shadowOffset = CGSize(width: 0, height: 2)
        subView.layer.shadowColor = UIColor.black.cgColor
        subView.layer.shadowOpacity = 0.1
    }
}
