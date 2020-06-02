//
//  CardDetailsViewModel.swift
//  WBooks
//
//  Created by Nacho 2 on 10/05/2020.
//  Copyright © 2020 Wolox. All rights reserved.
//

import Foundation
import ReactiveSwift

class CardDetailsViewModel {
    private let _userRepository = RepositoryBuilder.getDefaultUserRepository()
    private var _bookModel: Book
    let rentState = MutableProperty<RentResultState>(.loading)
    
    init(bookModel: Book) {
        _bookModel = bookModel
    }
    
    var id: Int {
        _bookModel.id!
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
    
    // MARK: - Api requests
    
    func rentBook() {
        rentState.value = .loading
        let from = Date()
        let to = Calendar.current.date(byAdding: .day, value: 1, to: Date()) ?? Date()
        let rentModel = Rent(bookId: _bookModel.id!, from: from, to: to)
        _userRepository.rentBook(rentModel: rentModel).startWithResult { [weak self] result in
            switch result {
            case .success(let result):
                print(result)
                self?._bookModel.status = BookStatus.unavailable.rawValue
                self?.rentState.value = .success
            case .failure(let error):
                print(error)
                self?.rentState.value = .error
            }
        }
    }
}

enum BookStatus: String {
    case available = "Available"
    case unavailable = "Unavailable"
}

enum RentResultState {
    case loading
    case success
    case error
}
