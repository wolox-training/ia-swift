//
//  UserRepository.swift
//  WBooks
//
//  Created by Nacho 2 on 07/05/2020.
//  Copyright © 2020 Wolox. All rights reserved.
//

import Result
import Networking
import Argo
import ReactiveSwift

class UserRepository: AbstractRepository {
    private static let postRentPath = "/users/5/rents"
    
    func rentBook(rentModel: Rent) -> SignalProducer<Rent, RepositoryError> {
        let path = UserRepository.postRentPath
        let params: [String: Any] = [
            "userID": 5,
            "bookID": rentModel.bookId,
            "from": rentModel.from,
            "to": rentModel.to
        ]
        return performRequest(method: .post, path: path, parameters: params) { json in
            return decode(json).toResult()
        }
    }
}
