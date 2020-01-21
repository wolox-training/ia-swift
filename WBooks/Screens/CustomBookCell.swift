//
//  CustomBookCell.swift
//  WBooks
//
//  Created by Nacho 2 on 20/01/2020.
//  Copyright © 2020 Wolox. All rights reserved.
//

import UIKit

class CustomBookCell: UITableViewCell {

    @IBOutlet weak var view: UIView! {
        didSet {
            view.layer.cornerRadius = 20
            view.layer.shadowOffset = CGSize(width: 0, height: 10)
        }
    }
    @IBOutlet weak var imageSource: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
