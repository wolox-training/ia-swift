//
//  SuggestionsViewModel.swift
//  WBooks
//
//  Created by Nacho 2 on 18/05/2020.
//  Copyright © 2020 Wolox. All rights reserved.
//

import ReactiveSwift
import ReactiveCocoa

class SuggestionsViewModel {
    private let _bookRepository = RepositoryBuilder.getDefaultBookRepository()
    private var _bookModel: Book
    let sugestState = MutableProperty<SuggestResultState>(.success)
    let isFormComplete = MutableProperty<Bool>(false)
    
    init(bookModel: Book) {
        _bookModel = bookModel
    }

    func bindFormInputs(bookName: CustomFieldInput,
                        bookAuthor: CustomFieldInput,
                        bookYear: CustomFieldInput,
                        bookGenre: CustomFieldInput) {
        bookName.reactive.textValues.observeValues { text in
            self._bookModel.title = text
        }
        bookAuthor.reactive.textValues.observeValues { text in
            self._bookModel.author = text
        }
        bookGenre.reactive.textValues.observeValues { text in
            self._bookModel.genre = text
        }
        bookYear.reactive.textValues.observeValues { text in
            self._bookModel.year = text
        }
        let s1: Signal<Bool, Never> = bookName.isValidInput.signal.map { $0 }
        let s2: Signal<Bool, Never> = bookAuthor.isValidInput.signal.map { $0 }
        let s3: Signal<Bool, Never> = bookYear.isValidInput.signal.map { $0 }
        let s4: Signal<Bool, Never> = bookGenre.isValidInput.signal.map { $0 }
        
        let combination = Signal<Bool, Never>.combineLatest(s1, s2, s3, s4)
        combination.observeValues { (arg) in
            let (name, author, year, genre) =  arg
            self.isFormComplete.value = name && author && year && genre
        }
    }
}

extension SuggestionsViewModel {
    
    // MARK: - Api requests
    
    func suggestBook() {
        sugestState.value = .loading

        _bookRepository.postBookSugestion(book: _bookModel).startWithResult { result in
            switch result {
            case .success(let result):
                print(result)
                self.sugestState.value = .success
            case .failure(let error):
                print(error)
                self.sugestState.value = .error
            }
        }
    }
}

enum SuggestResultState {
    case loading
    case error
    case success
}
