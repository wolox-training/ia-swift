//
//  BookDetailsViewModel.swift
//  WBooks
//
//  Created by Nacho 2 on 05/04/2020.
//  Copyright © 2020 Wolox. All rights reserved.
//

import Foundation

class BookDetailsViewModel {
    private let _bookRepository = BookRepository()
    private let _userRepository = UserRepository()
    private var _bookModel: Book
    private var commentsList: [Comment]
    
    init(bookModel: Book) {
        _bookModel = bookModel
        commentsList = []
    }
    
    var numberOfComments: Int {
        return commentsList.count
    }
    
    var isEmptyComments: Bool {
        return commentsList.isEmpty
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
    
    func getCommentCellViewModel(at indexPath: IndexPath) -> CommentCellViewModel {
        CommentCellViewModel(commentModel: commentsList[indexPath.row])
    }
}

extension BookDetailsViewModel {
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
    
    func getBookComments(onSuccess: @escaping () -> Void, onError: @escaping () -> Void) {
        let commentsSuccess: ([Comment]) -> Void = { comments in
            self.commentsList = comments
            onSuccess()
        }
        let commentsError: (Error) -> Void = { error in
            onError()
            print(error)
        }
        _bookRepository.fetchComments(bookId: self._bookModel.id, onSuccess: commentsSuccess, onError: commentsError)
    }
}
