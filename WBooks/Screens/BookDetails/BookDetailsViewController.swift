//
//  BookDetailsViewController.swift
//  WBooks
//
//  Created by Nacho 2 on 05/04/2020.
//  Copyright © 2020 Wolox. All rights reserved.
//

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
        _view.setupBookDetails(bookModel: _bookDetailsViewModel.bookModel)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        _view.updateCommentsLoading(isLoading: true)
        _bookDetailsViewModel.getBookComments(onSuccess: getCommentsSuccess, onError: getCommentsError)
        view.layer.backgroundColor = UIColor.creamBlue?.cgColor
        setTitle(headerTitle: "BOOK_DETAILS_HEADER_TITLE".localized())
        setNavigationBackButton()
        _view.rentButton.addTarget(self, action: #selector(rentButtonTapped), for: .touchUpInside)
    }
    
    func setupTableView() {
        _view.commentsTable.delegate = self
        _view.commentsTable.dataSource = self
        _view.commentsTable.register(cell: CommentCell.self)
        _view.commentsTable.separatorStyle = .none
    }
    
    @objc private func rentButtonTapped() {
        if _bookDetailsViewModel.bookModel.status == BookStatus.unavailable.rawValue {
            let alert = UIAlertController.createErrorAlert(message: "RENT_UNAVAILABLE".localized())
            self.present(alert, animated: true)
        } else {
            _view.updateRentLoading(isLoading: true)
            _bookDetailsViewModel.rentBook(onSuccess: rentBookSuccess, onError: rentBookError)
        }
    }
}

// MARK: - Extension for request callbacks
extension BookDetailsViewController {
    func rentBookSuccess() {
        _view.updateStatusStyle(newStatus: BookStatus.unavailable)
        _view.updateRentLoading(isLoading: false)
    }
    
    func rentBookError() {
        let alert = UIAlertController.createErrorAlert(message: "RENT_ERROR".localized())
        self.present(alert, animated: true)
        _view.updateRentLoading(isLoading: false)
    }
    
    func getCommentsSuccess() {
        _view.updateCommentsLoading(isLoading: false)
        if _bookDetailsViewModel.isEmptyComments {
            _view.commentsTable.setEmptyMessage("EMPTY_BOOK_COMMENTS".localized())
        } else {
            _view.commentsTable.restore()
        }
        _view.commentsTable.reloadData()
    }
    
    func getCommentsError() {
        _view.updateCommentsLoading(isLoading: false)
        let alert = UIAlertController.createErrorAlert(message: "RENT_ERROR".localized())
        self.present(alert, animated: true)
    }
}

// MARK: - UITable extensions
extension BookDetailsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}

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
