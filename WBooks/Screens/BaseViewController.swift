//
//  BaseViewController.swift
//  WBooks
//
//  Created by Nacho 2 on 22/01/2020.
//  Copyright © 2020 Wolox. All rights reserved.
//

import UIKit

private struct Constants {
    static let navigationBarColor: UIColor = .white
    static let navigationBarTitleFont: UIFont = UIFont.systemFont(ofSize: 18)
}

class BaseViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationBarBackgroundImage()
    }
    
    func setTitle(headerTitle: String) {
        setNavigationBarTitle(headerTitle, font: Constants.navigationBarTitleFont, color: .white)
    }
    
    func setLeftButtonImage(customImage: UIImage) {
        setNavigationLeftButtons([UIBarButtonItem(image: customImage, style: UIBarButtonItemStyle.plain, target: nil, action: nil)])
    }
    
    func setRightButtonImage(customImage: UIImage) {
        setNavigationRightButtons([UIBarButtonItem(image: customImage, style: UIBarButtonItemStyle.plain, target: nil, action: nil)])
    }
    
    func setNavigationBarBackgroundImage() {
        let image = UIImage.backgroundNavigator
        let imageView = UIImageView(image: image)
        view.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        let height: CGFloat = UIScreen.main.bounds.width * image.size.height / image.size.width
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.topAnchor),
            imageView.heightAnchor.constraint(equalToConstant: height),
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }

}
