//
//  BookDetailsViewModel.swift
//  WBooks
//
//  Created by Nacho 2 on 05/04/2020.
//  Copyright © 2020 Wolox. All rights reserved.
//

import Foundation

class BookDetailsViewModel {
    let bookRepository = BookRepository()
    let userRepository = UserRepository()
    let bookModel: Book
    var commentsList: [Comment]
    
    init(bookModel: Book) {
        self.bookModel = bookModel
        self.commentsList = []
    }
    
    var numberOfComments: Int {
        return commentsList.count
    }
    
    func getCommentCellViewModel(at indexPath: IndexPath) -> CommentCellViewModel {
        CommentCellViewModel(commentModel: commentsList[indexPath.row])
    }
}

extension BookDetailsViewModel {
    func rentBook(onSuccess: @escaping () -> Void, onError: @escaping () -> Void) {
        let rentSuccess = {
            onSuccess()
        }
        let rentError: (Error) -> Void = { error in
            onError()
            print(error)
        }
        let from = Date()
        let to = Calendar.current.date(byAdding: .day, value: 1, to: Date()) ?? Date()
        let rentModel = Rent(bookId: bookModel.id, from: from, to: to)
        userRepository.rentBook(rentModel: rentModel, onSuccess: rentSuccess, onError: rentError)
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
        bookRepository.fetchComments(bookId: self.bookModel.id, onSuccess: commentsSuccess, onError: commentsError)
    }
}
