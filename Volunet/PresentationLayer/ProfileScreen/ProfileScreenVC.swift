//
//  ProfileScreenVC.swift
//  Volunet
//
//  Created by Софья Тимохина on 03.02.2022.
//

import UIKit

protocol IProfileScreenVC: UIViewController {

}

final class ProfileScreenVC: UIViewController, IProfileScreenVC {
    private let interator: IProfileScreenInterator
    private let router: IProfileScreenRouter

    lazy var profileScreenView: ProfileScreenView = {
        let view = ProfileScreenView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backButton.addTarget(self, action: #selector(didTabBackButton), for: .touchUpInside)
        return view
    }()

    init(interator: IProfileScreenInterator,
         router: IProfileScreenRouter) {
        self.interator = interator
        self.router = router
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }

    private func setup() {
        setNavigationControllerTransparent()
        hideKeyboardWhenTappedAround()

        view.backgroundColor = .background
        view.addSubview(profileScreenView)
        NSLayoutConstraint.activate([
            profileScreenView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            profileScreenView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            profileScreenView.topAnchor.constraint(equalTo: view.topAnchor),
            profileScreenView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 100),
        ])
        profileScreenView.frame.size.width = view.frame.width
        profileScreenView.setup(with: interator.profile)
    }

    @objc
    func didTabBackButton() {
        router.goBack()
    }
}
