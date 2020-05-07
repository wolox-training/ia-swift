//
//  Rent.swift
//  WBooks
//
//  Created by Nacho 2 on 07/05/2020.
//  Copyright © 2020 Wolox. All rights reserved.
//

import Foundation

struct Rent {
    let bookId: Int
    let from: String
    let to: String
    
    init (bookId: Int, from: Date, to: Date) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        self.bookId = bookId
        self.from = dateFormatter.string(from: from)
        self.to = dateFormatter.string(from: to)
    }
}
