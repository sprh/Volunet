//
//  MessageBubble.swift
//  Volunet
//
//  Created by Софья Тимохина on 25.04.2022.
//

import Foundation
import UIKit

class MessageBubble: UITextView {
    override init(frame: CGRect, textContainer: NSTextContainer?) {
        super.init(frame: frame, textContainer: textContainer)
        setup()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }

    init() {
        super.init(frame: .zero, textContainer: nil)
        setup()
    }

    override var canBecomeFirstResponder: Bool {
        return false
    }

    private func setup() {
        backgroundColor = .clear

        layer.cornerRadius = 22
        layer.masksToBounds = true
        layer.borderWidth = 1
        layer.borderColor = UIColor.white.cgColor

        isEditable = false
        isSelectable = true
        dataDetectorTypes = [.flightNumber, .calendarEvent, .address, .phoneNumber, .link, .lookupSuggestion]
        isUserInteractionEnabled = true
        delaysContentTouches = true
        font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        translatesAutoresizingMaskIntoConstraints = false
        textContainerInset = UIEdgeInsets(top: 15, left: 20, bottom: 15, right: 20)
        textContainer.lineFragmentPadding = 0

        linkTextAttributes = [NSAttributedString.Key.underlineStyle: NSUnderlineStyle.single]

    }


    func calculatedSize(in size: CGSize) -> CGSize {
        return sizeThatFits(CGSize(width: size.width, height: .infinity))
    }
}
