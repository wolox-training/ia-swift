//
//  UIColorExtension.swift
//  WBooks
//
//  Created by Nacho 2 on 23/01/2020.
//  Copyright © 2020 Wolox. All rights reserved.
//

import UIKit

extension UIColor {
    static let oceanBlue = UIColor(hex: "00ADEF")
    static let creamBlue = UIColor(hex: "EAF6FA")
    static let creamRed = UIColor(hex: "D0021B")
    static let creamGreen = UIColor(hex: "A5CD39")
    static let strongBlue = UIColor(hex: "00ADEE")
    static let lightBlue = UIColor(hex: "00ADEC")
    static let lightGreen = UIColor(hex: "39CCCD")
    static let blueGradient: [CGColor] = [(lightBlue?.cgColor ?? UIColor.blue.cgColor), lightGreen?.cgColor ?? UIColor.green.cgColor]
}
