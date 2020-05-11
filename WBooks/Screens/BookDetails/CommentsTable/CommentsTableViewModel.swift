//
//  CommentsTableViewModel.swift
//  WBooks
//
//  Created by Nacho 2 on 10/05/2020.
//  Copyright © 2020 Wolox. All rights reserved.
//

import Foundation

class CommentsTableViewModel {
    private var _bookRepository = BookRepository()
    private var _bookId: Int
    private var commentsList: [Comment]
    
    init(bookId: Int) {
        _bookId = bookId
        commentsList = []
    }
    
    var numberOfComments: Int {
        return commentsList.count
    }
    
    var isEmptyComments: Bool {
        return commentsList.isEmpty
    }
    
    func getCommentCellViewModel(at indexPath: IndexPath) -> CommentCellViewModel {
        CommentCellViewModel(commentModel: commentsList[indexPath.row])
    }
}

extension CommentsTableViewModel {
    func getBookComments(onSuccess: @escaping () -> Void, onError: @escaping () -> Void) {
        let commentsSuccess: ([Comment]) -> Void = { comments in
            self.commentsList = comments
            onSuccess()
        }
        let commentsError: (Error) -> Void = { error in
            onError()
            print(error)
        }
        _bookRepository.fetchComments(bookId: _bookId, onSuccess: commentsSuccess, onError: commentsError)
    }
}
