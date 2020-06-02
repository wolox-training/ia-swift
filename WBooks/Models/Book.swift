//
//  Book.swift
//  WBooks
//
//  Created by Nacho 2 on 02/04/2020.
//  Copyright © 2020 Wolox. All rights reserved.
//

import Argo
import Curry
import Runes

struct Book {
    
    let id: Int?
    var title: String
    var author: String
    var genre: String
    var year: String
    var image: String?
    var status: String

}

extension Book: Argo.Decodable {
    static func decode(_ json: JSON) -> Decoded<Book> {
        return curry(Book.init)
        <^> json <|? "id"
        <*> json <| "title"
        <*> json <| "author"
        <*> json <| "genre"
        <*> json <| "year"
        <*> json <|? "image"
        <*> json <| "status"
    }
}
