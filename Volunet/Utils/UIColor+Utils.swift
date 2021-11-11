//
//  UIColor+Utils.swift
//  Volunet
//
//  Created by Софья Тимохина on 06.11.2021.
//

import Foundation
import UIKit

/**
 UIColor extension with custom colors from assets.
 */
extension UIColor {
    static var background: UIColor {
        UIColor(named: "backgroundColor")!
    }

    static var darkTeal: UIColor {
        UIColor(named: "darkTealColor")!
    }

    static var lightGreen: UIColor {
        UIColor(named: "lightGreenColor")!
    }

    static var lightTeal: UIColor {
        UIColor(named: "lightTealColor")!
    }

    static var teal: UIColor {
        UIColor(named: "tealColor")!
    }

    static var text: UIColor {
        UIColor(named: "textColor")!
    }

    static var secondaryText: UIColor {
        UIColor(named: "secondaryTextColor")!
    }
}

