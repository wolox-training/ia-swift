//
//  BookDetailsView.swift
//  WBooks
//
//  Created by Nacho 2 on 05/04/2020.
//  Copyright © 2020 Wolox. All rights reserved.
//

import Foundation
import UIKit
import WolmoCore

class BookDetailsView: UIView, NibLoadable {
    @IBOutlet weak var bookTitle: UILabel!
    @IBOutlet weak var bookStatus: UILabel!
    @IBOutlet weak var bookAuthor: UILabel!
    @IBOutlet weak var bookYear: UILabel!
    @IBOutlet weak var bookGen: UILabel!
    @IBOutlet weak var bookImage: UIImageView!
    @IBOutlet weak var rentButton: UIButton! {
        didSet {
            rentButton.setTitle("RENT".localized(), for: UIControlState.normal)
            rentButton.layer.borderWidth = 2.0
            rentButton.layer.cornerRadius = 20
            // rentButton.layer.borderColor = UIColor.white.cgColor
        }
    }
    @IBOutlet weak var addToWishButton: UIButton! {
        didSet {
            addToWishButton.setTitle("TO_WISH_LIST".localized(), for: UIControlState.normal)
            addToWishButton.layer.borderWidth = 2.0
            addToWishButton.layer.cornerRadius = 20
            // addToWishButton.layer.borderColor = UIColor.white.cgColor
        }
    }
    
}
