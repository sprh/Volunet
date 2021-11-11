//
//  UIView+Utils.swift
//  Volunet
//
//  Created by Софья Тимохина on 07.11.2021.
//

import UIKit

extension UIView {
    func makeGradientBackground(with colors: [CGColor]) {
        let gradient = CAGradientLayer()
        gradient.colors = colors
        gradient.locations = [0.0, 1.0]
        gradient.frame = bounds
        layer.insertSublayer(gradient, at: 0)
    }
}
