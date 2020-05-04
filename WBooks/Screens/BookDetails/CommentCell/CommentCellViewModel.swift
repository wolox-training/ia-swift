//
//  CommentCellViewModel.swift
//  WBooks
//
//  Created by Nacho 2 on 01/05/2020.
//  Copyright © 2020 Wolox. All rights reserved.
//

import UIKit

class CommentCellViewModel {
    let commentModel: Comment
    
    init(commentModel: Comment) {
        self.commentModel = commentModel
    }
    
    var image: String? {
        guard let imageName = commentModel.image, imageName.isNotEmpty else { return nil }
        return  imageName
    }
    
    var username: String {
        return commentModel.username
    }
    
    var content: String {
        return commentModel.content
    }
}
