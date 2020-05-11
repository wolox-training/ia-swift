//
//  CardDetailsView.swift
//  WBooks
//
//  Created by Nacho 2 on 10/05/2020.
//  Copyright © 2020 Wolox. All rights reserved.
//

import UIKit
import WolmoCore

class CardDetailsView: UIView, NibLoadable {
    @IBOutlet weak var bookCard: UIStackView! {
        didSet {
            bookCard.applyCardStyle(backgroundColor: UIColor.white)
        }
    }
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var bookTitle: UILabel!
    @IBOutlet weak var bookStatus: UILabel!
    @IBOutlet weak var bookAuthor: UILabel!
    @IBOutlet weak var bookYear: UILabel!
    @IBOutlet weak var bookGen: UILabel!
    @IBOutlet weak var bookImage: UIImageView!
    @IBOutlet weak var rentButton: UIButton! {
        didSet {
            rentButton.setTitle("RENT".localized(), for: UIControl.State.normal)
            rentButton.layer.borderWidth = 0
            rentButton.layer.cornerRadius = 20
        }
    }
    @IBOutlet weak var addToWishButton: UIButton! {
        didSet {
            addToWishButton.setTitle("TO_WISH_LIST".localized(), for: UIControl.State.normal)
            addToWishButton.layer.borderWidth = 2.0
            addToWishButton.layer.cornerRadius = 20
            addToWishButton.layer.borderColor = UIColor.strongBlue?.cgColor
        }
    }
    
    // MARK: - functions to update styles
    
    func setupBookDetails(title: String, genre: String, year: String, author: String, status: BookStatus, image: String?) {
        bookTitle.text = title
        bookGen.text = genre
        bookYear.text = year
        bookAuthor.text = author
        bookStatus.text = status.rawValue
        updateStatusStyle(newStatus: status)
        
        if let image = image {
            bookImage.loadUrl(from: image, defaultImage: UIImage.defaultBook)
        } else {
            bookImage.image = .defaultBook
        }
    }
    
    func updateStatusStyle(newStatus: BookStatus) {
        bookStatus.text = newStatus.rawValue
        if newStatus == BookStatus.unavailable {
            bookStatus.textColor = UIColor.creamRed
            rentButton.applyGradient(colors: UIColor.grayGradient)
            rentButton.isUserInteractionEnabled = false
        } else {
            bookStatus.textColor = UIColor.creamGreen
            rentButton.applyGradient(colors: UIColor.blueGradient)
            rentButton.isUserInteractionEnabled = true
        }
    }
    
    func updateRentLoading(isLoading: Bool) {
        if isLoading {
            activityIndicator.isHidden = false
            activityIndicator.startAnimating()
            bookCard.alpha = 0.5
        } else {
            activityIndicator.isHidden = true
            activityIndicator.stopAnimating()
            bookCard.alpha = 1.0
        }
    }
}
