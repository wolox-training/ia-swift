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
    private let bookRepository = BookRepository()
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
    
    // API request
    func getBooks() {
        libraryTableState.value = .loading
        let fetchSuccess: ([Book]) -> Void = { books in
            self.booksList.value = books
            self.libraryTableState.value = books.isEmpty ? .empty : .value
        }
        
        let onError: (Error) -> Void = { error in
            self.libraryTableState.value = .error
            print(error)
        }
        
        bookRepository.fetchBooks(onSuccess: fetchSuccess, onError: onError)
    }
}

public enum LibraryTableState {
    case loading
    case value
    case error
    case empty
}
