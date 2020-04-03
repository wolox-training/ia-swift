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

internal class BookRepository {
    
    let url = URL(string: "https://swift-training-backend.herokuapp.com/books")!
    
    public func fetchBooks(onSuccess: @escaping ([Book]) -> Void, onError: @escaping (Error) -> Void) {
        request(url, method: .get).responseJSON { response in
                switch response.result {
                case .success(let value):
                    guard let JSONbooks = try? JSONSerialization.data(withJSONObject: value, options: []) else {
                        onError(BookError.decodeError)
                        return
                    }
                    guard let books = try? JSONDecoder().decode([Book].self, from: JSONbooks) else {
                        onError(BookError.decodeError)
                        return
                    }
                    onSuccess(books)
                case .failure(let error):
                    onError(error)
                }
            }
    }

}

enum BookError: Error {
    case decodeError
}
