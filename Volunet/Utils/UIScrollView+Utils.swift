//
//  UIScrollView+Utils.swift
//  Volunet
//
//  Created by Софья Тимохина on 16.01.2022.
//

import UIKit

extension UIScrollView {
    func setContentSize() {
        contentSize.height = (subviews.sorted(by: { $0.frame.maxY < $1.frame.maxY }).last?.frame.maxY ?? contentSize.height) + UIViewController.bottomSafeAreaHeight
    }
}
