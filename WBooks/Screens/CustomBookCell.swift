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
    }
    
    func setBookAttributes(data: [String : String]) {
        if let imageName = data["image"] {
            imageSource.image = UIImage(named: imageName)
        }
        titleLabel.text = data["title"]
        subtitleLabel.text = data["subtitle"]
    }
}
