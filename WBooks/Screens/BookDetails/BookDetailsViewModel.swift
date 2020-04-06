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
}
