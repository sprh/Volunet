//
//  UIFont+Utils.swift
//  Volunet
//
//  Created by Софья Тимохина on 11.11.2021.
//

import UIKit

extension UIFont {
    static var changaOneLargeTitle: UIFont {
        UIFont(name: "ChangaOne", size: 70)!
    }

    static var changaOneTitle: UIFont {
        UIFont(name: "ChangaOne", size: 57)!
    }

    private func withTraits(traits: UIFontDescriptor.SymbolicTraits) -> UIFont {
        let descriptor = fontDescriptor.withSymbolicTraits(traits)
        return UIFont(descriptor: descriptor!, size: 0)
    }

    func makeBold() -> UIFont {
        return withTraits(traits: .traitBold)
    }

    func makeItalik() -> UIFont {
        return withTraits(traits: .traitItalic)
    }
}
