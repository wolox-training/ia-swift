//
//  CommentsTableViewModel.swift
//  WBooks
//
//  Created by Nacho 2 on 10/05/2020.
//  Copyright © 2020 Wolox. All rights reserved.
//

import Foundation
import ReactiveSwift

class CommentsTableViewModel {
    private var _bookRepository = BookRepository()
    private var _bookId: Int
    private let _commentsList = MutableProperty<[Comment]>([])
    let commentsTableState = MutableProperty(CommentsTableState.loading)
    
    init(bookId: Int) {
        _bookId = bookId
    }
    
    var numberOfComments: Int {
        return _commentsList.value.count
    }
    
    var isEmptyComments: Bool {
        return _commentsList.value.isEmpty
    }
    
    func getCommentCellViewModel(at indexPath: IndexPath) -> CommentCellViewModel {
        CommentCellViewModel(commentModel: _commentsList.value[indexPath.row])
    }
}

extension CommentsTableViewModel {
    func getBookComments() {
        let commentsSuccess: ([Comment]) -> Void = { comments in
            self._commentsList.value = comments
            self.commentsTableState.value = comments.isEmpty ? .empty : .value
        }
        let commentsError: (Error) -> Void = { error in
            print(error)
        }
        _bookRepository.fetchComments(bookId: _bookId, onSuccess: commentsSuccess, onError: commentsError)
    }
}

public enum CommentsTableState {
    case loading
    case value
    case error
    case empty
}
