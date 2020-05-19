//
//  BookRepository.swift
//  WBooks
//
//  Created by Nacho 2 on 03/04/2020.
//  Copyright © 2020 Wolox. All rights reserved.
//

import Result
import Networking
import Argo
import ReactiveSwift

class BookRepository: AbstractRepository {
    private static let fetchBooksPath = "/books"
    private static let fetchCommentsPath: (Int) -> String = { bookId in "/books/\(bookId)/comments" }
    
    func fetchBooks() -> SignalProducer<[Book], RepositoryError> {
        let path = BookRepository.fetchBooksPath
        
        return performRequest(method: .get, path: path) { json in
            return decode(json).toResult()
        }
    }
    
    func fetchComments(bookId: Int) -> SignalProducer<[Comment], RepositoryError> {
        let path = BookRepository.fetchCommentsPath(bookId)
        
        return performRequest(method: .get, path: path) { json in
            return decode(json).toResult()
        }
    }
}
