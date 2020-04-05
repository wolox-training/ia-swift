//
//  MainViewController.swift
//  WBooks
//
//  Created by Nacho 2 on 20/01/2020.
//  Copyright © 2020 Wolox. All rights reserved.
//

import UIKit
import WolmoCore

class LibraryViewController: BaseViewController {
    private let _libraryViewModel: LibraryViewModel
    private let _view: LibraryView = LibraryView.loadFromNib()!
    
    // MARK: - UIViewController

    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        fatalError("init(nibName:bundle:) has not been implemented")
    }
    
    // MARK: - LibraryViewController

    init(viewModel: LibraryViewModel) {
        _libraryViewModel = viewModel
        super.init(nibName: .none, bundle: .none)
    }

    override public func loadView() {
        view = _view
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.layer.backgroundColor = UIColor.creamBlue?.cgColor
        setTitle(headerTitle: "LIBRARY_VIEW_HEADER_TITLE".localized())
        setLeftButtonImage(customImage: UIImage.notificationsIcon)
        setRightButtonImage(customImage: UIImage.searchIcon)
        setupTableView()
        _libraryViewModel.getBooks()
    }
    
    func setupTableView() {
        _view.booksTable.delegate = self
        _view.booksTable.dataSource = self
        _view.booksTable.register(cell: CustomBookCell.self)
        _libraryViewModel.reloadTableView = _view.booksTable.reloadData
        _libraryViewModel.updateLoadingStatus = { [weak self] () in
            DispatchQueue.main.async {
                let isLoading = self?._libraryViewModel.isLoading ?? false
                if isLoading {
                    self?._view.activityIndicator.isHidden = false
                    self?._view.activityIndicator.startAnimating()
                    self?._view.booksTable.alpha = 0.0
                } else {
                    self?._view.activityIndicator.isHidden = true
                    self?._view.activityIndicator.stopAnimating()
                    self?._view.booksTable.alpha = 1.0
                }
            }
        }
    }
}

extension LibraryViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}

extension LibraryViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeue(cell: CustomBookCell.self) else { return UITableViewCell() }
        let cellVM = _libraryViewModel.getCellViewModel(at: indexPath)
        cell.setBookAttributes(cellVM: cellVM)
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        _libraryViewModel.numberOfBooks
    }
}
