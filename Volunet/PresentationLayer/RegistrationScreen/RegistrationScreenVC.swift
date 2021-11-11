//
//  RegistrationScreenVC.swift
//  Volunet
//
//  Created by Софья Тимохина on 11.11.2021.
//

import UIKit

protocol IRegistrationScreenVC: UIViewController {

}

final class RegistrationScreenVC: UIViewController, IRegistrationScreenVC {
    private let interator: IRegistrationScreenInterator
    private let router: IRegistrationScreenRouter

    let registrationScreenView: RegistrationScreenView = {
        let view = RegistrationScreenView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    init(interator: IRegistrationScreenInterator,
         router: IRegistrationScreenRouter) {
        self.interator = interator
        self.router = router
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        hideKeyboardWhenTappedAround()
        view.backgroundColor = .background
        view.addSubview(registrationScreenView)
        NSLayoutConstraint.activate([
            registrationScreenView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            registrationScreenView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            registrationScreenView.topAnchor.constraint(equalTo: view.topAnchor),
            registrationScreenView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
        registrationScreenView.setup()
    }
}

