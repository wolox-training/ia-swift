//
//  LoginView.swift
//  WBooks
//
//  Created by Nacho 2 on 14/01/2020.
//  Copyright © 2020 Wolox. All rights reserved.
//

import UIKit
import WolmoCore

class LoginView: UIView, NibLoadable {

    @IBOutlet weak var loginButton: UIButton! {
        didSet {
            loginButton.setTitle("LOGIN_BUTTON".localized(), for: UIControlState.normal)
            loginButton.layer.borderWidth = 2.0
            loginButton.layer.cornerRadius = 20
            loginButton.layer.borderColor = UIColor.white.cgColor
        }
    }
    
    @IBOutlet weak var footerLabel: UILabel! {
        didSet {
            footerLabel.text = "FOOTER_LOGIN_TEXT".localized()
        }
    }
}
