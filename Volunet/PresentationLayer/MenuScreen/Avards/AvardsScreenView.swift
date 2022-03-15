//
//  AvardsScreenView.swift
//  Volunet
//
//  Created by Софья Тимохина on 14.02.2022.
//

import UIKit

final class AvardsScreenView: UIView {
    lazy var avardsImage: UIView = {
        let avatar = RoundedImageView(frame: CGRect(x: 0,
                                                    y: 0,
                                                    width: 100,
                                                    height: 100),
                                      image: .avardsImage,
                                      layerColor: .lightTeal)
        avatar.translatesAutoresizingMaskIntoConstraints = false
        return avatar
    }()

    lazy var avardsPanel: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 50
        view.layer.maskedCorners = [.layerMaxXMinYCorner,
                                    .layerMinXMinYCorner]
        view.clipsToBounds = true
        return view
    }()

    lazy var myAvardsLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = .getLocalizedString(for: .myAvards)
        label.font = .preferredFont(forTextStyle: .title1)
        label.textColor = .black
        return label
    }()

    lazy var avardsTable: UITableView = {
        let tableView = UITableView(frame: frame, style: .insetGrouped)
        tableView.backgroundColor = .clear
        tableView.register(AvardCell.self, forCellReuseIdentifier: "\(AvardCell.self)")
        tableView.alwaysBounceVertical = true
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.contentInset = UIEdgeInsets(top: 50, left: 0, bottom: 50, right: 0)
        tableView.estimatedRowHeight = 80
        tableView.showsVerticalScrollIndicator = false
        return tableView
    }()

    lazy var backButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        let imageView = UIImageView(frame: CGRect(x: 10, y: 10, width: 20, height: 20))
        imageView.image = .chevronLeft.withTintColor(.white)
        button.addSubview(imageView)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    func setup() {
        addSubview(avardsPanel)
        addSubview(avardsImage)
        addSubview(myAvardsLabel)
        avardsPanel.addSubview(avardsTable)
        avardsPanel.addSubview(backButton)

        NSLayoutConstraint.activate([
            avardsImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            avardsImage.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
            avardsImage.heightAnchor.constraint(equalToConstant: 100),
            avardsImage.widthAnchor.constraint(equalToConstant: 100),

            myAvardsLabel.leadingAnchor.constraint(equalTo: avardsImage.trailingAnchor, constant: 16),
            myAvardsLabel.bottomAnchor.constraint(equalTo: avardsImage.centerYAnchor, constant: -2),

            avardsPanel.leadingAnchor.constraint(equalTo: leadingAnchor),
            avardsPanel.trailingAnchor.constraint(equalTo: trailingAnchor),
            avardsPanel.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            avardsPanel.topAnchor.constraint(equalTo: avardsImage.centerYAnchor),

            backButton.leadingAnchor.constraint(equalTo: avardsPanel.leadingAnchor, constant: 16),
            backButton.topAnchor.constraint(equalTo: avardsPanel.topAnchor, constant: 46),

            avardsTable.leadingAnchor.constraint(equalTo: avardsPanel.leadingAnchor, constant: 8),
            avardsTable.trailingAnchor.constraint(equalTo: avardsPanel.trailingAnchor, constant: -16),
            avardsTable.topAnchor.constraint(equalTo: avardsPanel.topAnchor),
            avardsTable.bottomAnchor.constraint(equalTo: avardsPanel.bottomAnchor),
        ])
        layoutIfNeeded()
        avardsPanel.makeGradientBackground(with: [UIColor.lightTeal.cgColor,
                                                  UIColor.lightGreen.cgColor])
    }
}
