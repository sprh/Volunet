//
//  UIImageView+Utils.swift
//  Volunet
//
//  Created by Софья Тимохина on 12.11.2021.
//

import UIKit

extension UIImageView {
    func makeRounded() {
        layer.borderWidth = 1
        layer.masksToBounds = false
        layer.borderColor = UIColor.black.cgColor
        layer.cornerRadius = frame.height / 2
        clipsToBounds = true
    }
}

