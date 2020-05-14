//
//  LibraryViewModel.swift
//  WBooks
//
//  Created by Nacho 2 on 02/04/2020.
//  Copyright © 2020 Wolox. All rights reserved.
//
import UIKit
import ReactiveSwift

class LibraryViewModel {
    private let bookRepository = RepositoryBuilder.getDefaultBookRepository()
    private let booksList = MutableProperty<[Book]>([])
    let libraryTableState = MutableProperty(LibraryTableState.loading)
    
    var numberOfBooks: Int {
        return booksList.value.count
    }
    
    func getCellViewModel(at indexPath: IndexPath) -> CustomBookCellViewModel {
        CustomBookCellViewModel(bookModel: booksList.value[indexPath.row])
    }
    
    func getBookList() -> [Book] {
        booksList.value
    }
}

extension LibraryViewModel {
    
    // MARK: - Api requests
    
    func getBooks() {
        libraryTableState.value = .loading
        self.bookRepository.fetchBooks().startWithResult { [weak self] result in
            switch result {
            case .success(let resultArray):
                self?.booksList.value = resultArray
               self?.libraryTableState.value = resultArray.isEmpty ? .empty : .value
            case .failure(let error):
               print(error)
               self?.libraryTableState.value = .error
            }
        }
    }
}

public enum LibraryTableState {
    case loading
    case value
    case error
    case empty
}
