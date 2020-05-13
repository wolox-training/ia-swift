//
//  CardDetailsViewController.swift
//  WBooks
//
//  Created by Nacho 2 on 10/05/2020.
//  Copyright © 2020 Wolox. All rights reserved.
//

import UIKit
import ReactiveCocoa

class CardDetailsViewController: UIViewController {
    private let _cardDetailsViewModel: CardDetailsViewModel
    private let _view: CardDetailsView = CardDetailsView.loadFromNib()!
    
    // MARK: - UIViewController

    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        fatalError("init(nibName:bundle:) has not been implemented")
    }
    
    // MARK: - CardDetailsViewController

    init(viewModel: CardDetailsViewModel) {
        _cardDetailsViewModel = viewModel
        super.init(nibName: .none, bundle: .none)
    }
    
    override public func loadView() {
        view = _view
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.layer.backgroundColor = UIColor.creamBlue?.cgColor
        _view.setupBookDetails(title: _cardDetailsViewModel.title,
                                genre: _cardDetailsViewModel.genre,
                                year: _cardDetailsViewModel.year,
                                author: _cardDetailsViewModel.author,
                                status: _cardDetailsViewModel.status,
                                image: _cardDetailsViewModel.image)
        _view.rentButton.reactive.controlEvents(.touchUpInside).observeValues { _ in self.rentButtonTapped() }
        _view.addToWishButton.reactive.controlEvents(.touchUpInside).observeValues { _ in
            print("Add to wish list button")
        }
    }
    
    func rentButtonTapped() {
        if _cardDetailsViewModel.status == BookStatus.unavailable {
            let alert = UIAlertController.createErrorAlert(message: "RENT_UNAVAILABLE".localized())
            present(alert, animated: true)
        } else {
            _view.updateRentLoading(isLoading: true)
            _cardDetailsViewModel.rentBook(onSuccess: rentBookSuccess, onError: rentBookError)
        }
    }
}

// MARK: - Extension for request callbacks
extension CardDetailsViewController {
    func rentBookSuccess() {
        _view.updateStatusStyle(newStatus: _cardDetailsViewModel.status)
        _view.updateRentLoading(isLoading: false)
    }
    
    func rentBookError() {
        let alert = UIAlertController.createErrorAlert(message: "RENT_ERROR".localized())
        present(alert, animated: true)
        _view.updateRentLoading(isLoading: false)
    }
}
