//
//  CustomBookCell.swift
//  WBooks
//
//  Created by Nacho 2 on 20/01/2020.
//  Copyright © 2020 Wolox. All rights reserved.
//

import UIKit
import WolmoCore

class CustomBookCell: UITableViewCell, NibLoadable {
    
    @IBOutlet weak var view: UIView! {
        didSet {
            view.layer.cornerRadius = 5
            view.layer.shadowOffset = CGSize(width: 0, height: 2)
            view.layer.shadowColor = UIColor.black.cgColor
            view.layer.shadowOpacity = 0.1
        }
    }
    @IBOutlet weak var imageSource: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundColor = .clear
        selectionStyle = .none
    }
    
    func setBookAttributes(cellVM: CustomBookCellViewModel) {
        imageSource.image = UIImage.defaultBook
        if let image = cellVM.image {
            imageSource.loadUrl(from: image)
        }
        titleLabel.text = cellVM.title
        subtitleLabel.text = cellVM.author
    }
}
