//
//  BaseViewController.swift
//  WBooks
//
//  Created by Nacho 2 on 22/01/2020.
//  Copyright © 2020 Wolox. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.barStyle = .blackTranslucent
        setNavigationBar()
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedStringKey.foregroundColor:UIColor.white]
    }
    
    func setTitle(headerTitle: String? = nil) {
        title = headerTitle
    }
    
    func setLeftButtonImage(imageName: String) {
        setNavigationLeftButtons([UIBarButtonItem(image: UIImage(named: imageName), style: UIBarButtonItemStyle.plain, target: nil, action: nil)])
    }
    
    func setRightButtonImage(imageName: String) {
        setNavigationRightButtons([UIBarButtonItem(image: UIImage(named: imageName), style: UIBarButtonItemStyle.plain, target: nil, action: nil)])
    }
    
    func setNavigationBar() {
        guard let image = UIImage(named: "bc_nav bar") else { return }
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
