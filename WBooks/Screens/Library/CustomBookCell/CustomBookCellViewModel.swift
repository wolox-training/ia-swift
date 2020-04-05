//
//  CustomBookCellViewModel.swift
//  WBooks
//
//  Created by Nacho 2 on 02/04/2020.
//  Copyright © 2020 Wolox. All rights reserved.
//

import UIKit

class CustomBookCellViewModel {
    let bookModel: Book
    
    init(bookModel: Book) {
        self.bookModel = bookModel
    }
    
    var image: String {
        guard let imageName = bookModel.image else { return "" }
        return imageName
    }
    
    var title: String {
        return bookModel.title
    }
    
    var author: String {
        return bookModel.author
    }
}
