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
    @IBOutlet weak var bookCard: UIStackView! {
        didSet {
            bookCard.applyCardStyle(backgroundColor: UIColor.white)
        }
    }
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var booksLoadingIndicator: UIActivityIndicatorView!
    @IBOutlet weak var bookTitle: UILabel!
    @IBOutlet weak var bookStatus: UILabel!
    @IBOutlet weak var bookAuthor: UILabel!
    @IBOutlet weak var bookYear: UILabel!
    @IBOutlet weak var bookGen: UILabel!
    @IBOutlet weak var bookImage: UIImageView!
    @IBOutlet weak var rentButton: UIButton! {
        didSet {
            rentButton.applyGradient(colors: UIColor.blueGradient)
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
    @IBOutlet weak var commentsTable: UITableView!
    
    // MARK: - update status label
    func updateStyles(newStatus: String) {
        bookStatus.textColor = newStatus == "Unavailable" ? UIColor.creamRed : UIColor.creamGreen
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
    
    func updateCommentsLoading(isLoading: Bool) {
        if isLoading {
            booksLoadingIndicator.isHidden = false
            booksLoadingIndicator.startAnimating()
        } else {
            booksLoadingIndicator.isHidden = true
            booksLoadingIndicator.stopAnimating()
        }
    }
}
