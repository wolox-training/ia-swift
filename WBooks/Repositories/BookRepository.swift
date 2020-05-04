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
    
    public func fetchBooks(onSuccess: @escaping ([Book]) -> Void, onError: @escaping (Error) -> Void) {
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
    
    public func rentBook(bookId: Int, onSuccess: @escaping () -> Void, onError: @escaping (Error) -> Void) {
        let endpoint = "\(baseUrl)/users/5/rents"
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let params: [String: Any] = [
            "userID": 5,
            "bookID": bookId,
            "from": dateFormatter.string(from: Date()),
            "to": dateFormatter.string(from: Calendar.current.date(byAdding: .day, value: 1, to: Date()) ?? Date())
        ]
        request(endpoint, method: .post, parameters: params, encoding: JSONEncoding.default, headers: header ).responseJSON { response in
            switch response.result {
            case .success:
                print("sucesssss")
                onSuccess()
            case .failure(let error):
                onError(error)
            }
        }
    }
    
    public func fetchComments(bookId: Int, onSuccess: @escaping ([Comment]) -> Void, onError: @escaping (Error) -> Void) {
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

enum CommentError: Error {
    case decodeError
}
