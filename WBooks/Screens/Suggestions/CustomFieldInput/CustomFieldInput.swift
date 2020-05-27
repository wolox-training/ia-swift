//
//  CustomFieldInput.swift
//  WBooks
//
//  Created by Nacho 2 on 18/05/2020.
//  Copyright © 2020 Wolox. All rights reserved.
//

import UIKit
import ReactiveSwift

@IBDesignable
class CustomFieldInput: UITextField {
    private var _borderView: UIView = UIView()
    var isValidInput = MutableProperty<Bool>(true) {
        didSet {
            updateBorderStyle()
        }
    }
    // var validator: ((String) -> Bool)?
    
    // MARK: - Inspectable elements to set validator types. Just one at the moment
    @IBInspectable var notEmpty: Bool = true
    
    // MARK: - Class functions
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupUI()
        reactive.continuousTextValues.observeValues { text in
            self.validate(text: text)
        }
    }
    
    func setupUI() {
        borderStyle = .none
        addSubview(_borderView)
        _borderView.frame = CGRect(x: 0, y: 31, width: layer.frame.width, height: 1)
        _borderView.layer.borderColor = UIColor.inactiveGray?.cgColor
        _borderView.layer.borderWidth = 1
        attributedPlaceholder = NSAttributedString(string: attributedPlaceholder?.string ?? "", attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray])
    }
    
    func updateBorderStyle() {
        _borderView.layer.borderColor = isValidInput.value ? UIColor.inactiveGray?.cgColor : UIColor.red.cgColor
    }
    
    func validate(text: String) {
        if notEmpty {
            self.isValidInput.value = text.isNotEmpty
        }
    }
    
}
