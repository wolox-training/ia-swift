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
    private var _bookRepository = RepositoryBuilder.getDefaultBookRepository()
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
    
    // MARK: - Api requests
    
    func getBookComments() {
        commentsTableState.value = .loading
        _bookRepository.fetchComments(bookId: _bookId).startWithResult { [weak self] result in
            switch result {
            case .success(let resultArray):
                self?._commentsList.value = resultArray
                self?.commentsTableState.value = resultArray.isEmpty ? .empty : .value
            case .failure(let error):
               print(error)
               self?.commentsTableState.value = .error
            }
        }
    }
}

public enum CommentsTableState {
    case loading
    case value
    case error
    case empty
}
