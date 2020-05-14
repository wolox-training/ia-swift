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
    
    let id: Int
    let title: String
    let author: String
    let genre: String
    let year: String
    let image: String?
    var status: String

}

extension Book: Argo.Decodable {
    static func decode(_ json: JSON) -> Decoded<Book> {
        return curry(Book.init)
        <^> json <| "id"
        <*> json <| "title"
        <*> json <| "author"
        <*> json <| "genre"
        <*> json <| "year"
        <*> json <|? "image"
        <*> json <| "status"
    }
}
