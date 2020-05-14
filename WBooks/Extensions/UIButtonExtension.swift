//
//  UIButtonExtension.swift
//  WBooks
//
//  Created by Nacho 2 on 30/04/2020.
//  Copyright © 2020 Wolox. All rights reserved.
//

import UIKit
import WolmoCore

extension UIButton {
    func applyGradient(colors: [UIColor]) {
        gradient = ViewGradient(colors: colors, direction: .leftToRight)
    }
}
