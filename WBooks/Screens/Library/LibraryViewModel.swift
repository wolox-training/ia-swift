//
//  LibraryViewModel.swift
//  WBooks
//
//  Created by Nacho 2 on 02/04/2020.
//  Copyright © 2020 Wolox. All rights reserved.
//
import UIKit

class LibraryViewModel {
    let bookRepository = BookRepository()
    
    var booksList: [Book] = []
    
    var numberOfBooks: Int {
        return booksList.count
    }
    
    func getCellViewModel(at indexPath: IndexPath) -> CustomBookCellViewModel {
        CustomBookCellViewModel(bookModel: booksList[indexPath.row])
    }
    
    // API request
    func getBooks(onSuccess: @escaping () -> Void, onError: @escaping () -> Void) {
        
        let fetchSuccess: ([Book]) -> Void = { books in
            self.booksList = books
            onSuccess()
        }
        
        let onError: (Error) -> Void = { error in
            print(error)
            onError()
        }
        
        bookRepository.fetchBooks(onSuccess: fetchSuccess, onError: onError)
    }
}
