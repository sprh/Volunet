//
//  CustomTextCell.swift
//  Volunet
//
//  Created by Софья Тимохина on 25.04.2022.
//

import UIKit
import MessengerKit

class ChatMessageCell: MSGMessageCell {

    @IBOutlet weak var bubble: MessageBubble!

    @IBOutlet weak var bubbleWidthConstraint: NSLayoutConstraint!

    @IBOutlet weak var avatarView: UIImageView?

    var avatarGestureRecognizer: UITapGestureRecognizer!

    override open var message: MSGMessage? {
        didSet {
            guard let message = message,
                case let MSGMessageBody.text(body) = message.body else { return }

            bubble.text = body
            avatarView?.image = message.user.avatar ?? .volunteerOrganizationPlaceholder
        }
    }

    override var style: MSGMessengerStyle? {
        didSet {
            guard let style = style as? ChatViewStyle, let message = message else { return }
            bubble.layer.borderColor = message.user.isSender ? style.outgoingBorderColor.cgColor : style.incomingBorderColor.cgColor
            bubble.linkTextAttributes = [NSAttributedString.Key.underlineColor: style.outgoingLinkColor]
            bubble.linkTextAttributes = [NSAttributedString.Key.foregroundColor: style.outgoingLinkColor]
            bubble.font = style.font
            bubble.textColor = message.user.isSender ? .white : .black
            bubble.backgroundColor = message.user.isSender ? .darkTeal : .lightTeal
        }
    }

    override open func layoutSubviews() {
        super.layoutSubviews()
        let bubbleSize = bubble.calculatedSize(in: bounds.size)
        bubbleWidthConstraint.constant = bubbleSize.width
    }


    override func awakeFromNib() {
        super.awakeFromNib()
        avatarView?.layer.cornerRadius = 24
        avatarView?.layer.masksToBounds = true

        avatarGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(avatarTapped))
        avatarView?.addGestureRecognizer(avatarGestureRecognizer)
        avatarView?.isUserInteractionEnabled = true
    }

    @objc func avatarTapped(_ sender: UITapGestureRecognizer) {
        guard let user = message?.user else { return }
        delegate?.cellAvatarTapped(for: user)
    }

}
