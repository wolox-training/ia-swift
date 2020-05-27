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
    @IBOutlet weak var bookName: CustomFieldInput!
    @IBOutlet weak var bookAuthor: CustomFieldInput!
    @IBOutlet weak var bookYear: CustomFieldInput!
    @IBOutlet weak var bookTopic: CustomFieldInput!
    @IBOutlet weak var bookDescription: CustomFieldInput!
    @IBOutlet weak var submitButton: UIButton! {
        didSet {
            submitButton.layer.cornerRadius = 20
            setupSubmitButton(enabled: true)
        }
    }
    
    func setupSubmitButton(enabled: Bool) {
        if enabled {
            submitButton.applyGradient(colors: UIColor.blueGradient)
            submitButton.isUserInteractionEnabled = true
        } else {
            submitButton.applyGradient(colors: UIColor.grayGradient)
            submitButton.isUserInteractionEnabled = false
        }
    }
}
