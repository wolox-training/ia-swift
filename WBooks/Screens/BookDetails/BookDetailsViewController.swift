//
//  BookDetailsViewController.swift
//  WBooks
//
//  Created by Nacho 2 on 05/04/2020.
//  Copyright © 2020 Wolox. All rights reserved.
//

import UIKit

class BookDetailsViewController: BaseViewController {
    private let _cardDetailsViewModel: CardDetailsViewModel
    private let _view: BookDetailsView = BookDetailsView.loadFromNib()!
    
    // MARK: - UIViewController

    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        fatalError("init(nibName:bundle:) has not been implemented")
    }
    
    // MARK: - BookDetailsViewController

    init(viewModel: CardDetailsViewModel) {
        _cardDetailsViewModel = viewModel
        super.init(nibName: .none, bundle: .none)
    }
    
    override public func loadView() {
        view = _view
        addViewControllers()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.layer.backgroundColor = UIColor.creamBlue?.cgColor
        setTitle(headerTitle: "BOOK_DETAILS_HEADER_TITLE".localized())
        setNavigationBackButton()
    }
    
    func addViewControllers() {
        let cardDetailsController = CardDetailsViewController(viewModel: _cardDetailsViewModel)
        addChild(cardDetailsController)
        view.addSubview(cardDetailsController.view)
        let commentsViewModel = CommentsTableViewModel(bookId: _cardDetailsViewModel.id)
        let commentsTableController = CommentsTableViewController(viewModel: commentsViewModel)
        addChild(commentsTableController)
        view.addSubview(commentsTableController.view)
    }
}
