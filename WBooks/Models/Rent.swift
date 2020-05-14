//
//  Rent.swift
//  WBooks
//
//  Created by Nacho 2 on 07/05/2020.
//  Copyright © 2020 Wolox. All rights reserved.
//

import Argo
import Curry
import Runes

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
    
    init (bookId: Int, from: String, to: String) {
        self.bookId = bookId
        self.from = from
        self.to = to
    }
}

extension Rent: Argo.Decodable {
    static func decode(_ json: JSON) -> Decoded<Rent> {
        return curry(Rent.init)
        <^> json <| "bookID"
        <*> json <| "from"
        <*> json <| "to"
    }
}
