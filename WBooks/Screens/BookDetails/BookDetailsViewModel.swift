//
//  BookDetailsViewModel.swift
//  WBooks
//
//  Created by Nacho 2 on 05/04/2020.
//  Copyright © 2020 Wolox. All rights reserved.
//

import Foundation

class BookDetailsViewModel {
    let bookRepository = BookRepository()
    let bookModel: Book
    
    init(bookModel: Book) {
        self.bookModel = bookModel
    }
    
    var updateLoadingStatus = {}
    
    var isLoading: Bool = false {
        didSet {
            self.updateLoadingStatus()
        }
    }
    
    func rentBook(onSuccess: @escaping () -> Void, onError: @escaping () -> Void) {
        let rentSuccess = {
            onSuccess()
        }
        let rentError: (Error) -> Void = { error in
            onError()
            print(error)
        }
        bookRepository.rendBook(bookId: self.bookModel.id, onSuccess: rentSuccess, onError: rentError)
    }
}
