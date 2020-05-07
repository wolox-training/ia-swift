//
//  UIImageExtension.swift
//  WBooks
//
//  Created by Nacho 2 on 23/01/2020.
//  Copyright © 2020 Wolox. All rights reserved.
//

import UIKit

extension UIImage {
    static let empty: UIImage = UIImage()
    static let backIcon: UIImage = UIImage(named: "ic_back") ?? UIImage()
    static let notificationsIcon: UIImage = UIImage(named: "ic_notifications") ?? UIImage()
    static let searchIcon: UIImage = UIImage(named: "ic_search") ?? UIImage()
    static let backgroundNavigator: UIImage = UIImage(named: "bc_nav bar") ?? UIImage()
    static let addNewIcon: UIImage = UIImage(named: "ic_add_new") ?? UIImage()
    static let addNewActiveIcon: UIImage = UIImage(named: "ic_add_new_active") ?? UIImage()
    static let libraryIcon: UIImage = UIImage(named: "ic_library") ?? UIImage()
    static let libraryActiveIcon: UIImage = UIImage(named: "ic_library_active") ?? UIImage()
    static let myRentalsIcon: UIImage = UIImage(named: "ic_myrentals") ?? UIImage()
    static let myRentalsActiveIcon: UIImage = UIImage(named: "ic_myrentals_active") ?? UIImage()
    static let settingsIcon: UIImage = UIImage(named: "ic_settings") ?? UIImage()
    static let settingsActiveIcon: UIImage = UIImage(named: "ic_settings_active") ?? UIImage()
    static let wishlistIcon: UIImage = UIImage(named: "ic_wishlist") ?? UIImage()
    static let wishlistActiveIcon: UIImage = UIImage(named: "ic_wishlist_active") ?? UIImage()
    static let defaultBook: UIImage = UIImage(named: "default_book") ?? UIImage()
    static let defaultUser: UIImage = UIImage(named: "img_user1") ?? UIImage()
}
