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
    
    var image: UIImage {
        guard let imageName = bookModel.image, let image = UIImage(named: imageName) else { return UIImage() }
        return image
    }
    
    var title: String {
        return bookModel.title
    }
    
    var author: String {
        return bookModel.author
    }
}
