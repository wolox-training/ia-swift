//
//  Comment.swift
//  WBooks
//
//  Created by Nacho 2 on 03/05/2020.
//  Copyright © 2020 Wolox. All rights reserved.
//

import Argo
import Curry
import Runes

struct Comment {
    
    // MARK: - Properties
    
    let id: Int
    let username: String
    let image: String?
    let content: String
}

extension Comment: Argo.Decodable {
    static func decode(_ json: JSON) -> Decoded<Comment> {
        return curry(Comment.init)
        <^> json <| "id"
        <*> json <| ["user", "username"]
        <*> json <|? ["user", "image"]
        <*> json <| "content"
    }
}
