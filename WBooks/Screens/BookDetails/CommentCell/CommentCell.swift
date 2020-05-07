//
//  CommentCellView.swift
//  WBooks
//
//  Created by Nacho 2 on 01/05/2020.
//  Copyright © 2020 Wolox. All rights reserved.
//

import WolmoCore

class CommentCell: UITableViewCell, NibLoadable {
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var userComment: UILabel! {
        didSet {
            userComment.contentMode = .scaleAspectFill
        }
    }
    @IBOutlet weak var userImage: UIImageView! {
        didSet {
            userImage.layer.cornerRadius = 5
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setCommentInformation(cellVM: CommentCellViewModel) {
        userName.text = cellVM.username
        userComment.text = cellVM.content
        if cellVM.image != nil {
            userImage.loadUrl(from: cellVM.image ?? "")
        } else {
            userImage.image = UIImage.defaultBook
        }
    }
}
