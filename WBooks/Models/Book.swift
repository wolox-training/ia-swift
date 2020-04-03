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
    let status: String
    
    public init(from: Decoder) throws {
        let container = try from.container(keyedBy: BookKey.self)
        id = try container.decode(Int.self, forKey: .id)
        title = try container.decode(String.self, forKey: .title)
        author = try container.decode(String.self, forKey: .author)
        genre = try container.decode(String.self, forKey: .genre)
        year = try container.decode(String.self, forKey: .year)
        image = try container.decode(String.self, forKey: .image)
        status = try container.decode(String.self, forKey: .status)
    }

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
