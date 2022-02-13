//
//  TabBarController.swift
//  Volunet
//
//  Created by Софья Тимохина on 13.02.2022.
//

import UIKit


final class TabBarController: UITabBarController {
    let controllers: [UIViewController]

    init(controllers: [UIViewController]) {
        self.controllers = controllers
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private let xInsets: CGFloat = 16
    private let yInsets: CGFloat = UIViewController.safeAreaHeight + 64

    override func viewDidLoad() {
        super.viewDidLoad()
        makeUI()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        print(tabBar.frame)
        let previousFrame = tabBar.frame
        tabBar.frame = CGRect(x: xInsets,
                              y: previousFrame.midY - yInsets,
                              width: previousFrame.width - 32,
                              height: previousFrame.height - 16)
    }

    // MARK: - UI Setup

    private func makeUI() {
        tabBar.itemPositioning = .centered
        tabBar.layer.cornerRadius = 32
        tabBar.contentMode = .bottom
        tabBar.backgroundColor = .whiteTeal
        tabBar.layer.masksToBounds = true

        viewControllers = controllers

//        for tab in self.tabBar.items! {
//            tab.imageInsets = UIEdgeInsets(top: 6, left: 0, bottom: -6, right: 0)
//        }
    }
}

