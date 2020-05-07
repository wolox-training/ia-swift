//
//  Book.swift
//  WBooks
//
//  Created by Nacho 2 on 02/04/2020.
//  Copyright © 2020 Wolox. All rights reserved.
//

import Foundation

struct Book: Codable {
    
    let id: Int
    let title: String
    let author: String
    let genre: String
    let year: String
    let image: String?
    var status: String

}

// Book Json keys enum
enum BookKey: String, CodingKey {
    case id
    case title
    case author
    case genre
    case year
    case image
    case status
}
