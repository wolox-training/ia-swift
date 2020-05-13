//
//  CommentsTableView.swift
//  WBooks
//
//  Created by Nacho 2 on 10/05/2020.
//  Copyright © 2020 Wolox. All rights reserved.
//

import UIKit
import WolmoCore

class CommentsTableView: UIView, NibLoadable {
    @IBOutlet weak var commentsLoadingIndicator: UIActivityIndicatorView!
    @IBOutlet weak var commentsTable: UITableView! {
        didSet {
            commentsTable.layer.cornerRadius = 5
            commentsTable.layer.shadowOffset = CGSize(width: 2, height: 2)
            commentsTable.layer.shadowColor = UIColor.black.cgColor
            commentsTable.layer.shadowOpacity = 0.2
        }
    }
    
    // MARK: - functions to update styles
    
    func updateCommentsLoading(isLoading: Bool) {
        if isLoading {
            commentsLoadingIndicator.isHidden = false
            commentsLoadingIndicator.startAnimating()
        } else {
            commentsLoadingIndicator.isHidden = true
            commentsLoadingIndicator.stopAnimating()
        }
    }
}
