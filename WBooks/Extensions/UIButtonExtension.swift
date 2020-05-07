//
//  UIButtonExtension.swift
//  WBooks
//
//  Created by Nacho 2 on 30/04/2020.
//  Copyright © 2020 Wolox. All rights reserved.
//

import UIKit

extension UIButton {
    func applyGradient(colors: [CGColor]) {
        self.backgroundColor = nil
        self.layer.sublayers?.removeFirst()
        self.layoutIfNeeded()
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = colors
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 1, y: 0)
        gradientLayer.frame = self.bounds
        gradientLayer.cornerRadius = self.frame.height/2
        gradientLayer.masksToBounds = false

        self.layer.insertSublayer(gradientLayer, at: 0)
        self.contentVerticalAlignment = .center
        self.setTitleColor(UIColor.white, for: .normal)
        self.titleLabel?.font = UIFont.boldSystemFont(ofSize: 17.0)
        self.titleLabel?.textColor = UIColor.white
    }
}
