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
    @IBOutlet weak var commentsTable: UITableView! {
        didSet {
            commentsTable.layer.cornerRadius = 5
            commentsTable.layer.shadowOffset = CGSize(width: 2, height: 2)
            commentsTable.layer.shadowColor = UIColor.black.cgColor
            commentsTable.layer.shadowOpacity = 0.2
        }
    }
    
    // MARK: - functions to update styles
    
    func setupBookDetails(bookModel: Book) {
        bookTitle.text = bookModel.title
        bookGen.text = bookModel.genre
        bookYear.text = bookModel.year
        bookAuthor.text = bookModel.author
        bookStatus.text = bookModel.status
        updateStatusStyle(newStatus: BookStatus(rawValue: bookModel.status) ?? BookStatus.unavailable)
        bookImage.image = UIImage.defaultBook
        if let image = bookModel.image {
            bookImage.loadUrl(from: image)
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

enum BookStatus: String {
    case available = "Available"
    case unavailable = "Unavailable"
}
