//
//  TabBarController.swift
//  Volunet
//
//  Created by Софья Тимохина on 13.02.2022.
//

import UIKit

final class TabBarController: UITabBarController {
    let controllers: [UIViewController]
    var previousFrame: CGRect = .zero

    init(controllers: [UIViewController]) {
        self.controllers = controllers
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private let xInsets: CGFloat = 16
    private let yInsets: CGFloat = UIViewController.safeAreaHeight - 32

    override func viewDidLoad() {
        super.viewDidLoad()
        makeUI()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        let currentFrame = tabBar.frame
        if (previousFrame == currentFrame) {
            return
        }
        previousFrame = currentFrame
        tabBar.frame = CGRect(x: xInsets,
                              y: currentFrame.midY - yInsets,
                              width: currentFrame.width - 32,
                              height: currentFrame.height - 16)
    }

    private func makeUI() {
        tabBar.itemPositioning = .centered
        tabBar.layer.cornerRadius = 32
        tabBar.contentMode = .bottom
        tabBar.backgroundColor = .whiteTeal
        tabBar.layer.masksToBounds = true

        viewControllers = controllers
    }
}

