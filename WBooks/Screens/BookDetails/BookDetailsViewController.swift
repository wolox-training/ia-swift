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
        _view.updateStyles(newStatus: _bookDetailsViewModel.bookModel.status)
        if _bookDetailsViewModel.bookModel.image != nil {
            _view.bookImage.loadUrl(from: _bookDetailsViewModel.bookModel.image ?? "")
        } else {
            _view.bookImage.image = UIImage.defaultBook
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        _bookDetailsViewModel.getBookComments(onSuccess: getCommentsSuccess, onError: getCommentsError)
        view.layer.backgroundColor = UIColor.creamBlue?.cgColor
        setTitle(headerTitle: "BOOK_DETAILS_HEADER_TITLE".localized())
        setNavigationBackButton()
        _view.rentButton.addTarget(self, action: #selector(rentButtonTapped), for: .touchUpInside)
    }
    
    func setupTableView() {
        _view.commentsTable.delegate = self as? UITableViewDelegate
        _view.commentsTable.dataSource = self
        _view.commentsTable.register(cell: CommentCell.self)
        _view.commentsTable.separatorStyle = .none
        _view.commentsTable.rowHeight = UITableViewAutomaticDimension
        _view.commentsTable.estimatedRowHeight = 100
    }
    
    @objc private func rentButtonTapped() {
        if _bookDetailsViewModel.bookModel.status == "Unavailable" {
            let alert = UIAlertController().createErrorAlert(message: "RENT_UNAVAILABLE".localized())
            self.present(alert, animated: true)
        } else {
            _view.updateLoading(isLoading: true)
            _bookDetailsViewModel.rentBook(onSuccess: rentBookSuccess, onError: rentBookError)
        }
    }
}

// MARK: - Extension for request callbacks
extension BookDetailsViewController {
    func rentBookSuccess() {
        _view.bookStatus.text = "Unavailable"
        _view.updateStyles(newStatus: "Unavailable")
        _view.updateLoading(isLoading: false)
    }
    
    func rentBookError() {
        let alert = UIAlertController().createErrorAlert(message: "RENT_ERROR".localized())
        self.present(alert, animated: true)
        _view.updateLoading(isLoading: false)
    }
    
    func getCommentsSuccess() {
        _view.commentsTable.reloadData()
    }
    
    func getCommentsError() {
        let alert = UIAlertController().createErrorAlert(message: "RENT_ERROR".localized())
        self.present(alert, animated: true)
    }
}

//// : - UITable extensions
//extension BookDetailsViewController: UITableViewDelegate {
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 100
//    }
//}

extension BookDetailsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeue(cell: CommentCell.self) else { return UITableViewCell() }
        let cellVM = _bookDetailsViewModel.getCommentCellViewModel(at: indexPath)
        cell.setCommentInformation(cellVM: cellVM)
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return _bookDetailsViewModel.numberOfComments
    }
}
