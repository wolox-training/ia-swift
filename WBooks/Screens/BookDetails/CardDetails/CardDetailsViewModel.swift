//
//  CardDetailsViewModel.swift
//  WBooks
//
//  Created by Nacho 2 on 10/05/2020.
//  Copyright © 2020 Wolox. All rights reserved.
//

import Foundation

class CardDetailsViewModel {
    private let _bookRepository = BookRepository()
    private let _userRepository = UserRepository()
    private var _bookModel: Book
    
    init(bookModel: Book) {
        _bookModel = bookModel
    }
    
    var id: Int {
        _bookModel.id
    }
    
    var status: BookStatus {
        BookStatus(rawValue: _bookModel.status) ?? BookStatus.unavailable
    }
    
    var title: String {
        _bookModel.title
    }
    
    var author: String {
        _bookModel.author
    }
    
    var genre: String {
        _bookModel.genre
    }
    
    var year: String {
        _bookModel.year
    }
    
    var image: String? {
        guard let imageName = _bookModel.image, imageName.isNotEmpty else { return nil }
        return  imageName
    }
}

extension CardDetailsViewModel {
    func rentBook(onSuccess: @escaping () -> Void, onError: @escaping () -> Void) {
        let rentSuccess = {
            self._bookModel.status = BookStatus.unavailable.rawValue
            onSuccess()
        }
        let rentError: (Error) -> Void = { error in
            onError()
            print(error)
        }
        let from = Date()
        let to = Calendar.current.date(byAdding: .day, value: 1, to: Date()) ?? Date()
        let rentModel = Rent(bookId: _bookModel.id, from: from, to: to)
        _userRepository.rentBook(rentModel: rentModel, onSuccess: rentSuccess, onError: rentError)
    }
}

enum BookStatus: String {
    case available = "Available"
    case unavailable = "Unavailable"
}
