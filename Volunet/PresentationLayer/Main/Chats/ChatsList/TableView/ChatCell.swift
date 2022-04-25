//
//  ChatCell.swift
//  Volunet
//
//  Created by Софья Тимохина on 25.04.2022.
//

import Foundation
import UIKit

class ChatCell: UITableViewCell {
    lazy var chatImage: RoundedImageView = {
        let view = RoundedImageView(frame: CGRect(x: 0,
                                                  y: 0,
                                                  width: 80,
                                                  height: 80),
                                    image: .volunteerOrganizationPlaceholder)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    lazy var chatName: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .preferredFont(forTextStyle: .title1)
        label.text = "Поездка в приют"
        return label
    }()

    lazy var lastMessage: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .preferredFont(forTextStyle: .title2)
        label.text = "Через 10 минут обед, не забывайте!"
        label.numberOfLines = 2
        return label
    }()

    lazy var lastMessageTime: UILabel = {
        let label = UILabel()
        label.text = "11:04"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .preferredFont(forTextStyle: .body)
        return label
    }()

    public func setup() {
        backgroundColor = .clear

        let topLine = UIView()
        topLine.backgroundColor = .whiteTeal
        topLine.translatesAutoresizingMaskIntoConstraints = false
        let bottomLine = UIView()
        bottomLine.backgroundColor = .whiteTeal
        bottomLine.translatesAutoresizingMaskIntoConstraints = false

        contentView.addSubview(topLine)
        contentView.addSubview(chatImage)
        contentView.addSubview(chatName)
        contentView.addSubview(lastMessage)
        contentView.addSubview(lastMessageTime)
        contentView.addSubview(bottomLine)

        NSLayoutConstraint.activate([
            topLine.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            topLine.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            topLine.topAnchor.constraint(equalTo: contentView.topAnchor),
            topLine.heightAnchor.constraint(equalToConstant: 2),

            chatImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            chatImage.topAnchor.constraint(equalTo: topLine.bottomAnchor, constant: 16),
            chatImage.heightAnchor.constraint(equalToConstant: 80),
            chatImage.widthAnchor.constraint(equalToConstant: 80),

            chatName.topAnchor.constraint(equalTo: chatImage.topAnchor, constant: 5),
            chatName.leadingAnchor.constraint(equalTo: chatImage.trailingAnchor, constant: 10),

            lastMessage.topAnchor.constraint(equalTo: chatName.bottomAnchor, constant: 5),
            lastMessage.leadingAnchor.constraint(equalTo: chatName.leadingAnchor),
            lastMessage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -40),


            lastMessageTime.trailingAnchor.constraint(equalTo: lastMessage.trailingAnchor, constant: 5),
            lastMessageTime.centerYAnchor.constraint(equalTo: lastMessage.centerYAnchor),

            bottomLine.topAnchor.constraint(equalTo: lastMessage.bottomAnchor, constant: 10),
            bottomLine.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -2),
            bottomLine.heightAnchor.constraint(equalToConstant: 2),
            bottomLine.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            bottomLine.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
        ])
    }
}

