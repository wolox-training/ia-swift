//
//  LoginViewController.swift
//  WBooks
//
//  Created by Nacho 2 on 15/01/2020.
//  Copyright © 2020 Wolox. All rights reserved.
//

import UIKit
import WolmoCore

class LoginViewController: UIViewController {
    private let _view: LoginView = LoginView.loadFromNib()!

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        fatalError("init(nibName:bundle:) has not been implemented")
    }
    
    init() {
        super.init(nibName: .none, bundle: .none)
    }
    
    override public func loadView() {
        view = _view
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        _view.loginButton.reactive.controlEvents(.touchUpInside).observeValues { _ in self.buttonTapped() }
    }

    func buttonTapped() {
        let homeViewController = TabBarController()
        homeViewController.modalPresentationStyle = .fullScreen
        present(homeViewController, animated: true, completion: nil)
    }
}
