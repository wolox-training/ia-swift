//
//  BookRepository.swift
//  WBooks
//
//  Created by Nacho 2 on 03/04/2020.
//  Copyright © 2020 Wolox. All rights reserved.
//

import Foundation
import Result
import Alamofire

class BookRepository {
    
    let baseUrl = URL(string: "https://swift-training-backend.herokuapp.com")!
    let header: HTTPHeaders = ["Content-Type": "application/json"]
    
    func fetchBooks(onSuccess: @escaping ([Book]) -> Void, onError: @escaping (Error) -> Void) {
        let endpoint = "\(baseUrl)/books"
        request(endpoint, method: .get).responseJSON { response in
                switch response.result {
                case .success(let value):
                    guard let JSONbooks = try? JSONSerialization.data(withJSONObject: value, options: []), let books = try? JSONDecoder().decode([Book].self, from: JSONbooks) else {
                        onError(BookError.decodeError)
                        return
                    }
                    onSuccess(books)
                case .failure(let error):
                    onError(error)
                }
            }
    }
    
    func fetchComments(bookId: Int, onSuccess: @escaping ([Comment]) -> Void, onError: @escaping (Error) -> Void) {
        let endpoint = "\(baseUrl)/books/\(bookId)/comments"
        request(endpoint, method: .get).responseJSON { response in
                switch response.result {
                case .success(let value):
                    guard let JSONcomments = try? JSONSerialization.data(withJSONObject: value, options: []), let comments = try? JSONDecoder().decode([Comment].self, from: JSONcomments) else {
                        onError(CommentError.decodeError)
                        return
                    }
                    onSuccess(comments)
                case .failure(let error):
                    onError(error)
                }
            }
    }
}

enum BookError: Error {
    case decodeError
}
