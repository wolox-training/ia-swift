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
    
    var reloadTableView = {}
    
    var booksList: [Book] = [Book]() {
        didSet {
            self.reloadTableView()
        }
    }
    
    var numberOfBooks: Int {
        return booksList.count
    }
    
    func getCellViewModel(at indexPath: IndexPath) -> CustomBookCellViewModel {
        CustomBookCellViewModel(bookModel: booksList[indexPath.row])
    }
    
    // API request
    func getBooks() {
        let onSuccess = { books in
            self.booksList = books
        }
                
        let onError = { error in
            print(error)
        }
                
        bookRepository.fetchBooks(onSuccess: onSuccess, onError: onError)
    }
}
