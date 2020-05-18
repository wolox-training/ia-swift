//
//  TabBarController.swift
//  WBooks
//
//  Created by Nacho 2 on 24/01/2020.
//  Copyright © 2020 Wolox. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        tabBar.barTintColor = .white
        setupTabs()
    }
    
    func setupTabs() {
        let libraryViewModel = LibraryViewModel()
        let main = WBooksNavigationController(rootViewController: LibraryViewController(viewModel: libraryViewModel))
        main.tabBarItem = UITabBarItem(title: "LIBRARY_TAB_TITLE".localized(), image: UIImage.libraryIcon, tag: 0)
        main.tabBarItem.selectedImage = UIImage.libraryActiveIcon
        let wishList = WishListViewController()
        wishList.tabBarItem = UITabBarItem(title: "WISH_LIST_TAB_TITLE".localized(), image: UIImage.wishlistIcon, tag: 1)
        wishList.tabBarItem.selectedImage = UIImage.wishlistActiveIcon
        let addNew = WBooksNavigationController(rootViewController: SuggestionsViewController(viewModel: SuggestionsViewModel()))
        addNew.tabBarItem = UITabBarItem(title: "ADD_NEW_TAB_TITLE".localized(), image: UIImage.addNewIcon, tag: 2)
        addNew.tabBarItem.selectedImage = UIImage.addNewActiveIcon
        let rentals = WishListViewController()
        rentals.tabBarItem = UITabBarItem(title: "RENTALS_TAB_TITLE".localized(), image: UIImage.myRentalsIcon, tag: 3)
        rentals.tabBarItem.selectedImage = UIImage.myRentalsActiveIcon
        let settings = WishListViewController()
        settings.tabBarItem = UITabBarItem(title: "SETTINGS_TAB_TITLE".localized(), image: UIImage.settingsIcon, tag: 4)
        settings.tabBarItem.selectedImage = UIImage.settingsActiveIcon
        viewControllers = [main, wishList, addNew, rentals, settings]
    }
}
