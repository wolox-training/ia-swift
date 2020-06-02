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
        viewSetup()
    }
}

extension SuggestionsViewController {
    func viewSetup() {
        view.layer.backgroundColor = UIColor.creamBlue?.cgColor
        setTitle(headerTitle: "SUGGEST_VIEW_HEADER_TITLE".localized())
        _view.setupSubmitButton(enabled: false)
        self._view.updateSuggestionLoading(isLoading: false)
        _suggestionsViewModel.sugestState.signal.observeValues(setupSuggestStatus)
        _suggestionsViewModel.bindFormInputs(bookName: _view.bookName!,
                                             bookAuthor: _view.bookAuthor!,
                                             bookYear: _view.bookYear!,
                                             bookGenre: _view.bookGenre!)
        _suggestionsViewModel.isFormComplete.signal.observeValues { valid in
            self._view.setupSubmitButton(enabled: valid)
        }
        _view.bookImage.reactive.controlEvents(.touchUpInside).observeValues { _ in
            self.choseImage()
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

extension SuggestionsViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func choseImage() {
        let alertController = UIAlertController(title: .none, message: .none, preferredStyle: .actionSheet)
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            let takePhotoAction = UIAlertAction(title: "Camera", style: .default) { _ in
                imagePickerController.sourceType = .camera
                self.present(imagePickerController, animated: true, completion: .none)
            }
            alertController.addAction(takePhotoAction)
        }

        let chooseGalleryAction = UIAlertAction(title: "Gallery", style: .default) { _ in
            imagePickerController.sourceType = .photoLibrary
            self.present(imagePickerController, animated: true, completion: .none)
        }
        alertController.addAction(chooseGalleryAction)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: .none)
        alertController.addAction(cancelAction)
        self.present(alertController, animated: true)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            _view.bookImage.setImage(image, for: .normal)
        }
                picker.dismiss(animated: true, completion: nil)
    }
}
