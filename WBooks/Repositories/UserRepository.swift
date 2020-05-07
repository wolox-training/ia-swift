//
//  UserRepository.swift
//  WBooks
//
//  Created by Nacho 2 on 07/05/2020.
//  Copyright © 2020 Wolox. All rights reserved.
//

import Foundation
import Result
import Alamofire

class UserRepository {
    
    let baseUrl = URL(string: "https://swift-training-backend.herokuapp.com")!
    let header: HTTPHeaders = ["Content-Type": "application/json"]
    
    public func rentBook(rentModel: Rent, onSuccess: @escaping () -> Void, onError: @escaping (Error) -> Void) {
        let endpoint = "\(baseUrl)/users/5/rents"
        let params: [String: Any] = [
            "userID": 5,
            "bookID": rentModel.bookId,
            "from": rentModel.from,
            "to": rentModel.to
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
}

enum CommentError: Error {
    case decodeError
}
