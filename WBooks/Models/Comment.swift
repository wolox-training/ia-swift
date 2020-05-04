//
//  Comment.swift
//  WBooks
//
//  Created by Nacho 2 on 03/05/2020.
//  Copyright © 2020 Wolox. All rights reserved.
//

import Foundation
// Comment Json keys enum
enum CommentKey: String, CodingKey {
    case id
    case username
    case image
    case content
}

struct Comment: Codable {
    // MARK: - Properties
    let id: Int
    let username: String
    let image: String?
    let content: String
    // MARK: - Codable
    // Coding Keys
    enum CodingKeys: String, CodingKey {
        case user
        case id
        case username
        case image
        case content
    }
    // Decoding
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let userContainer = try container.nestedContainer(keyedBy: CodingKeys.self, forKey: .user)
        id = try container.decode(Int.self, forKey: .id)
        content = try container.decode(String.self, forKey: .content)
        username = try userContainer.decode(String.self, forKey: .username)
        image = try userContainer.decode(String.self, forKey: .image)
    }
    // Encoding
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        var user = container.nestedContainer(keyedBy: CodingKeys.self, forKey: .user)
        try user.encode(username, forKey: .username)
        try user.encode(image, forKey: .image)
        try container.encode(id, forKey: .id)
        try container.encode(content, forKey: .content)
    }
}
