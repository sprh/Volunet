//
//  StartScreenVC.swift
//  Volunet
//
//  Created by Софья Тимохина on 12.03.2022.
//

import UIKit

protocol IStartScreenVC: UIViewController {
    func openWelcomingScreen()
    func openMainPage()
}

final class StartScreenVC: UIViewController, IStartScreenVC {
    private let router: IStartScreenRouter
    private let interactor: IStartScreenInteractor

    lazy var imageView: UIImageView = {
        let view = UIImageView(image: .launchScreenImage)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentMode = .scaleAspectFit
        return view
    }()

    lazy var dotsLoadingView: UIView = {
        let view = DotsAnimationView(dotColor: .darkTeal)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.startAnimation()
        return view
    }()

    init(router: IStartScreenRouter, interactor: IStartScreenInteractor) {
        self.router = router
        self.interactor = interactor
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        interactor.tryToSignIn()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .background
        view.addSubview(imageView)
        view.addSubview(dotsLoadingView)
        NSLayoutConstraint.activate([
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            imageView.topAnchor.constraint(equalTo: view.topAnchor),
            imageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),

            dotsLoadingView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            dotsLoadingView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
    }

    func openWelcomingScreen() {
        router.openWelcomingScreen()
    }

    func openMainPage() {
        router.openMainPage()
    }
}

