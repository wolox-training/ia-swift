//
//  SuggestionsView.swift
//  WBooks
//
//  Created by Nacho 2 on 18/05/2020.
//  Copyright © 2020 Wolox. All rights reserved.
//

import UIKit
import WolmoCore

class SuggestionsView: UIView, NibLoadable {
    
    @IBOutlet weak var suggestCard: UIStackView! {
        didSet {
            suggestCard.applyCardStyle(backgroundColor: UIColor.white)
        }
    }
    @IBOutlet weak var bookImage: UIButton!
    @IBOutlet weak var submitButton: UIButton! {
        didSet {
            submitButton.applyGradient(colors: UIColor.blueGradient)
            submitButton.layer.cornerRadius = 20
        }
    }
}
