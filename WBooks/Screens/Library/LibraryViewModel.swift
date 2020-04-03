//
//  LibraryViewModel.swift
//  WBooks
//
//  Created by Nacho 2 on 02/04/2020.
//  Copyright © 2020 Wolox. All rights reserved.
//
import UIKit

// Mock Data
let book1 = Book(title: "The best book in the world", author: "Peter Sjermstrom", image: "img_book2")
let book2 = Book(title: "A little bird told me", author: "Timpthy Cross", image: "img_book3")
let book3 = Book(title: "When the doves desappeared", author: "Sofi Oksanen", image: "img_book4")

class LibraryViewModel {
    
    var booksList: [Book] = [book1, book2, book3]
    
    var numberOfBooks: Int {
        return booksList.count
    }
    
    func getCellViewModel(at indexPath: IndexPath) -> CustomBookCellViewModel {
        CustomBookCellViewModel(bookModel: booksList[indexPath.row])
    }
}
