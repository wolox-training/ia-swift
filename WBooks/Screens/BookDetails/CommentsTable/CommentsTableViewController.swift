//
//  CommentsTableViewController.swift
//  WBooks
//
//  Created by Nacho 2 on 10/05/2020.
//  Copyright © 2020 Wolox. All rights reserved.
//

import UIKit

class CommentsTableViewController: BaseViewController {
    private let _commentsTableViewModel: CommentsTableViewModel
    private let _view: CommentsTableView = CommentsTableView.loadFromNib()!
    
    // MARK: - UIViewController

    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        fatalError("init(nibName:bundle:) has not been implemented")
    }
    
    // MARK: - CommentsTableViewController

    init(viewModel: CommentsTableViewModel) {
        _commentsTableViewModel = viewModel
        super.init(nibName: .none, bundle: .none)
    }
    
    override public func loadView() {
        view = _view
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        _view.updateCommentsLoading(isLoading: true)
        _commentsTableViewModel.getBookComments(onSuccess: getCommentsSuccess, onError: getCommentsError)
    }
    
    func setupTableView() {
        _view.commentsTable.delegate = self
        _view.commentsTable.dataSource = self
        _view.commentsTable.register(cell: CommentCell.self)
        _view.commentsTable.separatorStyle = .none
    }
}

// MARK: - Extension for request callbacks
extension CommentsTableViewController {
    func getCommentsSuccess() {
        _view.updateCommentsLoading(isLoading: false)
        if _commentsTableViewModel.isEmptyComments {
            _view.commentsTable.setEmptyMessage("EMPTY_BOOK_COMMENTS".localized())
        } else {
            _view.commentsTable.restore()
        }
        _view.commentsTable.reloadData()
    }
    
    func getCommentsError() {
        _view.updateCommentsLoading(isLoading: false)
        let alert = UIAlertController.createErrorAlert(message: "RENT_ERROR".localized())
        present(alert, animated: true)
    }
}

// MARK: - UITable extensions
extension CommentsTableViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}

extension CommentsTableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeue(cell: CommentCell.self) else { return UITableViewCell() }
        let cellVM = _commentsTableViewModel.getCommentCellViewModel(at: indexPath)
        cell.setCommentInformation(cellVM: cellVM)
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return _commentsTableViewModel.numberOfComments
    }
}
