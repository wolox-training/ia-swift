//
//  SuggestionsViewController.swift
//  WBooks
//
//  Created by Nacho 2 on 18/05/2020.
//  Copyright © 2020 Wolox. All rights reserved.
//

import UIKit

class SuggestionsViewController: BaseViewController {
    private let _suggestionsViewModel: SuggestionsViewModel
    private let _view: SuggestionsView = SuggestionsView.loadFromNib()!
    // MARK: - UIViewController

    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        fatalError("init(nibName:bundle:) has not been implemented")
    }
    
    // MARK: - LibraryViewController

    init(viewModel: SuggestionsViewModel) {
        _suggestionsViewModel = viewModel
        super.init(nibName: .none, bundle: .none)
    }

    override public func loadView() {
        view = _view
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.layer.backgroundColor = UIColor.creamBlue?.cgColor
        setTitle(headerTitle: "SUGGEST_VIEW_HEADER_TITLE".localized())
        _view.setupSubmitButton(enabled: false)
        _suggestionsViewModel.sugestState.signal.observeValues(setupSuggestStatus)
        _suggestionsViewModel.bindFormInputs(bookName: _view.bookName!,
                                             bookAuthor: _view.bookAuthor!,
                                             bookYear: _view.bookYear!,
                                             bookGenre: _view.bookGenre!)
        _suggestionsViewModel.isFormComplete.signal.observeValues { valid in
            self._view.setupSubmitButton(enabled: valid)
        }
        _view.submitButton.reactive.controlEvents(.touchUpInside).observeValues { _ in
            self._suggestionsViewModel.suggestBook()
        }
    }
    
    func setupSuggestStatus(status: SuggestResultState) {
        switch status {
        case .success:
            self._view.updateSuggestionLoading(isLoading: false)
            let alert = UIAlertController.createErrorAlert(message: "SUGGEST_SUCCESS".localized())
            present(alert, animated: true)
        case .error:
            self._view.updateSuggestionLoading(isLoading: false)
            let alert = UIAlertController.createErrorAlert(message: "REQUEST_ERROR_BODY".localized())
            present(alert, animated: true)
        case .loading:
            self._view.updateSuggestionLoading(isLoading: true)
        }
    }
}
