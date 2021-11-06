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
    public var background: UIColor {
        UIColor(named: "backgroundColor")!
    }

    public var darkTeal: UIColor {
        UIColor(named: "darkTealColor")!
    }

    public var lightGreen: UIColor {
        UIColor(named: "lightGreenColor")!
    }

    public var lightTeal: UIColor {
        UIColor(named: "lightTealColor")!
    }

    public var teal: UIColor {
        UIColor(named: "tealColor")!
    }
}
