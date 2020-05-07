//
//  MainView.swift
//  WBooks
//
//  Created by Nacho 2 on 20/01/2020.
//  Copyright © 2020 Wolox. All rights reserved.
//

import UIKit
import WolmoCore

class LibraryView: UIView, NibLoadable {
    @IBOutlet weak var booksTable: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
}
