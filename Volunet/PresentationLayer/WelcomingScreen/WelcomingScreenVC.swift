//
//  WelcomingScreenVC.swift
//  Volunet
//
//  Created by Софья Тимохина on 06.11.2021.
//

import UIKit

final class WelcomingScreenVC: UIViewController {
    private var router: IWelcomingScreenRouter

    lazy var welcomingScreenView: WelcomingScreenView = {
        let view = WelcomingScreenView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    init(router: IWelcomingScreenRouter) {
        self.router = router
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .background
        view.addSubview(welcomingScreenView)
        NSLayoutConstraint.activate([
            welcomingScreenView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            welcomingScreenView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            welcomingScreenView.topAnchor.constraint(equalTo: view.topAnchor),
            welcomingScreenView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
        welcomingScreenView.setup()
        addTargets()
    }

    func addTargets() {
        welcomingScreenView.registrationButton.addTarget(self,
                                                         action: #selector(didTapRegistrationButton),
                                                         for: .touchUpInside)
        welcomingScreenView.signInButton.addTarget(self,
                                                   action: #selector(didTapSignInButton),
                                                   for: .touchUpInside)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.navigationBar.isHidden = false
    }

    @objc
    func didTapRegistrationButton() {
        router.openRegistrationPage()
    }

    @objc
    func didTapSignInButton() {
        router.openRegistrationPage()
    }
}

