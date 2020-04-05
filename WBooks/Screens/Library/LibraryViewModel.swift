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
    var updateLoadingStatus = {}
    
    var booksList: [Book] = [Book]() {
        didSet {
            self.reloadTableView()
        }
    }
    
    var isLoading: Bool = false {
        didSet {
            self.updateLoadingStatus()
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
        isLoading = true
        
        let onSuccess: ([Book]) -> Void = { books in
            self.isLoading = false
            self.booksList = books
        }
        
        let onError: (Error) -> Void = { error in
            self.isLoading = false
            print(error)
        }
        
        bookRepository.fetchBooks(onSuccess: onSuccess, onError: onError)
    }
}
