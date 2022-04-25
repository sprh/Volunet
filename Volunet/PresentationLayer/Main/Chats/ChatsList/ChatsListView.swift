//
//  ChatsListView.swift
//  Volunet
//
//  Created by Софья Тимохина on 25.04.2022.
//

import UIKit

class ChatsListView: UIView {
    lazy var screenTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .preferredFont(forTextStyle: .title1).makeBold()
        label.textColor = .whiteTeal
        label.text = .getLocalizedString(for: .messages)
        return label
    }()

    lazy var chatsPanel: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 45
        view.layer.maskedCorners = [.layerMaxXMinYCorner,
                                    .layerMinXMinYCorner]
        view.clipsToBounds = true
        return view
    }()

    lazy var chatsList: UITableView = {
        let tableView = UITableView()
        tableView.alwaysBounceVertical = true
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .clear
        tableView.register(ChatCell
                            .self,
                           forCellReuseIdentifier: "\(ChatCell.self)")
        tableView.estimatedRowHeight = UITableView.automaticDimension
        tableView.contentInset = UIEdgeInsets(top: 50, left: 0, bottom: 50, right: 0)
        return tableView
    }()

    public func setup() {
        addSubview(screenTitle)
        addSubview(chatsPanel)
        chatsPanel.addSubview(chatsList)

        NSLayoutConstraint.activate([
            screenTitle.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            screenTitle.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),

            chatsPanel.leadingAnchor.constraint(equalTo: leadingAnchor),
            chatsPanel.topAnchor.constraint(equalTo: screenTitle.bottomAnchor, constant: 10),
            chatsPanel.trailingAnchor.constraint(equalTo: trailingAnchor),
            chatsPanel.bottomAnchor.constraint(equalTo: bottomAnchor),

            chatsList.topAnchor.constraint(equalTo: chatsPanel.topAnchor),
            chatsList.bottomAnchor.constraint(equalTo: chatsPanel.bottomAnchor),
            chatsList.leadingAnchor.constraint(equalTo: chatsPanel.leadingAnchor),
            chatsList.trailingAnchor.constraint(equalTo: chatsPanel.trailingAnchor),
        ])
        layoutIfNeeded()

        makeGradientBackground(with: [UIColor.teal.cgColor,
                                      UIColor.darkTeal.cgColor])
        chatsPanel.makeGradientBackground(with: [UIColor.lightTeal.cgColor,
                                                   UIColor.lightGreen.cgColor])
    }
}
