//
//  CustomFieldInput.swift
//  WBooks
//
//  Created by Nacho 2 on 18/05/2020.
//  Copyright © 2020 Wolox. All rights reserved.
//

import UIKit

@IBDesignable
class CustomFieldInput: UITextField {
    private var _borderView = UIView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupUI()
    }
    
    func setupUI() {
        borderStyle = .none
        addSubview(_borderView)
        _borderView.frame = CGRect(x: 0, y: 31, width: layer.frame.width, height: 1)
        _borderView.layer.borderColor = UIColor.inactiveGray?.cgColor
        _borderView.layer.borderWidth = 1
        attributedPlaceholder = NSAttributedString(string: attributedPlaceholder?.string ?? "", attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray])
    }
}
