//
//  BookDetailsViewController.swift
//  WBooks
//
//  Created by Nacho 2 on 05/04/2020.
//  Copyright © 2020 Wolox. All rights reserved.
//

import Foundation
import UIKit

class BookDetailsViewController: BaseViewController {
    private let _bookDetailsViewModel: BookDetailsViewModel
    private let _view: BookDetailsView = BookDetailsView.loadFromNib()!
    
    // MARK: - UIViewController

    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        fatalError("init(nibName:bundle:) has not been implemented")
    }
    
    // MARK: - BookDetailsViewController

    init(viewModel: BookDetailsViewModel) {
        _bookDetailsViewModel = viewModel
        super.init(nibName: .none, bundle: .none)
    }
    
    override public func loadView() {
        view = _view
        _view.bookTitle.text = _bookDetailsViewModel.bookModel.title
        _view.bookGen.text = _bookDetailsViewModel.bookModel.genre
        _view.bookYear.text = _bookDetailsViewModel.bookModel.year
        _view.bookAuthor.text = _bookDetailsViewModel.bookModel.author
        _view.bookStatus.text = _bookDetailsViewModel.bookModel.status
        if _bookDetailsViewModel.bookModel.image != nil {
            _view.bookImage.loadUrl(from: _bookDetailsViewModel.bookModel.image ?? "")
        } else {
            _view.bookImage.image = UIImage.defaultBook
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.layer.backgroundColor = UIColor.creamBlue?.cgColor
        setTitle(headerTitle: "BOOK_DETAILS_HEADER_TITLE".localized())
        setNavigationBackButton()
        _view.rentButton.addTarget(self, action: #selector(rentButtonTapped), for: .touchUpInside)
    }
    
    @objc private func rentButtonTapped() {
        _bookDetailsViewModel.rentBook(onSuccess: rentBookSuccess, onError: rentBookError)
    }
}

extension BookDetailsViewController {
    func rentBookSuccess() {
        print("")
    }
    
    func rentBookError() {
        print("")
    }
}
