//
//  MenuScreenView.swift
//  Volunet
//
//  Created by Софья Тимохина on 13.03.2022.
//

import UIKit

final class MenuScreenView: UIView {
    lazy var profileImage: UIView = {
        let avatar = RoundedImageView(frame: CGRect(x: 0,
                                                    y: 0,
                                                    width: 200,
                                                    height: 200),
                                      image: .volunteerOrganizationPlaceholder, // TODO: change image
                                      layerColor: .white, borderWidth: 14)
        avatar.translatesAutoresizingMaskIntoConstraints = false
        return avatar
    }()

    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.alwaysBounceVertical = true
        scrollView.isScrollEnabled = true
        return scrollView
    }()

    lazy var menuPanel: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 50
        view.layer.maskedCorners = [.layerMaxXMinYCorner,
                                    .layerMinXMinYCorner]
        view.clipsToBounds = true
        return view
    }()

    lazy var profileButton: UIButton = {
        let button = MenuItemButton(title: "Profile") // TODO: translate
        button.translatesAutoresizingMaskIntoConstraints = false

        return button
    }()

    func setup() {
        addSubview(menuPanel)
        addSubview(profileImage)
        menuPanel.addSubview(scrollView)
        scrollView.addSubview(profileButton)

        NSLayoutConstraint.activate([
            profileImage.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
            profileImage.centerXAnchor.constraint(equalTo: centerXAnchor),
            profileImage.heightAnchor.constraint(equalToConstant: 200),
            profileImage.widthAnchor.constraint(equalToConstant: 200),

            menuPanel.leadingAnchor.constraint(equalTo: leadingAnchor),
            menuPanel.trailingAnchor.constraint(equalTo: trailingAnchor),
            menuPanel.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            menuPanel.topAnchor.constraint(equalTo: profileImage.centerYAnchor),

            scrollView.leadingAnchor.constraint(equalTo: menuPanel.leadingAnchor),
            scrollView.topAnchor.constraint(equalTo: menuPanel.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: menuPanel.bottomAnchor),
            scrollView.trailingAnchor.constraint(equalTo: menuPanel.trailingAnchor),

            profileButton.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 116),
            profileButton.leadingAnchor.constraint(equalTo: scrollView.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            profileButton.trailingAnchor.constraint(equalTo: scrollView.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            profileButton.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -16)
        ])
        layoutIfNeeded()
        menuPanel.makeGradientBackground(with: [UIColor.lightTeal.cgColor,
                                                  UIColor.lightGreen.cgColor])
        makeGradientBackground(with: [UIColor.lightTeal.cgColor,
                                      UIColor.darkTeal.cgColor,
                                      UIColor.darkTeal.cgColor,
                                      UIColor.darkTeal.cgColor])
        scrollView.setContentSize()
    }
}
