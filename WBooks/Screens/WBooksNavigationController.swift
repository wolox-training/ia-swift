//
//  WBooksNavigationController.swift
//  WBooks
//
//  Created by Nacho 2 on 23/01/2020.
//  Copyright © 2020 Wolox. All rights reserved.
//

import Foundation
import UIKit

final class WBooksNavigationController: UINavigationController {

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationBarStyle()
    }

    private func setNavigationBarStyle() {
        navigationBar.shadowImage = .empty
        navigationBar.setBackgroundImage(.empty, for: .default)
        navigationBar.tintColor = .white
    }
}
