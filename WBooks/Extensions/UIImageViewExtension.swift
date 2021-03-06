//
//  UIImageViewExtension.swift
//  WBooks
//
//  Created by Nacho 2 on 03/04/2020.
//  Copyright © 2020 Wolox. All rights reserved.
//

import UIKit

extension UIImageView {
    func loadUrl(from url: String, defaultImage: UIImage) {
        guard let imageURL = URL(string: url) else { return }
        DispatchQueue.global().async {
            if let data = try? Data(contentsOf: imageURL), let image  = UIImage(data: data) {
                DispatchQueue.main.async {
                    self.image = image
                }
            } else {
                DispatchQueue.main.async {
                    self.image = defaultImage
                }
            }
        }
    }
}
