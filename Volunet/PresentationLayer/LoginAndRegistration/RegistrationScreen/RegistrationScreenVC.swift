//
//  RegistrationScreenVC.swift
//  Volunet
//
//  Created by Софья Тимохина on 11.11.2021.
//

import UIKit

protocol IRegistrationScreenVC: UIViewController {
    func goToMainScreen()
    func showErrorDialog(error: String)
}

final class RegistrationScreenVC: UIViewController, IRegistrationScreenVC {
    private let interator: IRegistrationScreenInterator
    private let router: IRegistrationScreenRouter

    lazy var registrationScreenView: RegistrationScreenView = {
        let view = RegistrationScreenView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    lazy var backButton: UIBarButtonItem = {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        let imageView = UIImageView(frame: CGRect(x: 10, y: 10, width: 20, height: 20))
        imageView.image = .chevronLeft.withTintColor(.lightTeal)
        button.addSubview(imageView)
        button.addTarget(self, action: #selector(didTabBackButton), for: .touchUpInside)
        let leftBarButtonItem = UIBarButtonItem(customView: button)
        return leftBarButtonItem
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
        setup()
        addTargets()
    }

    private func setup() {
        navigationItem.setHidesBackButton(true, animated: false)
        navigationItem.leftBarButtonItem = backButton
        setNavigationControllerTransparent()
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

    private func addTargets() {
        registrationScreenView.joinButton.addTarget(self,
                                                    action: #selector(didTapJoinButton),
                                                    for: .touchUpInside)
        registrationScreenView.nameTextField.addTarget(self,
                                                       action: #selector(textFieldDidChange),
                                                       for: .editingChanged)
        registrationScreenView.emailTextField.addTarget(self,
                                                       action: #selector(textFieldDidChange),
                                                       for: .editingChanged)
        registrationScreenView.passwordTextField.addTarget(self,
                                                       action: #selector(textFieldDidChange),
                                                       for: .editingChanged)
    }

    @objc
    func didTabBackButton() {
        router.goBack()
    }

    @objc
    func textFieldDidChange() {
        if (registrationScreenView.nameTextField.text?.isEmpty ?? false ||
            registrationScreenView.emailTextField.text?.isEmpty ?? false ||
            registrationScreenView.passwordTextField.text?.isEmpty ?? false) {
            registrationScreenView.joinButton.isEnabled = false
        } else {
            registrationScreenView.joinButton.isEnabled = true
        }
    }

    @objc
    func didTapJoinButton() {
        let name = registrationScreenView.nameTextField.text
        let password = registrationScreenView.passwordTextField.text
        let email = registrationScreenView.emailTextField.text
        let accountType = registrationScreenView.roleSegmentedControl.selectedSegmentIndex
        guard let name = name, let email = email, let password = password, !password.isEmpty, !email.isEmpty, !name.isEmpty else {
            return
        }
        registrationScreenView.joinButton.startAnimation()
        backButton.isEnabled = false
        interator.onTapRegister(email: email, password: password, name: name, accountType: accountType)
    }

    func stopLoading() {
        registrationScreenView.joinButton.stopAnimation()
        backButton.isEnabled = true
    }

    func showErrorDialog(error: String) {
        stopLoading()
        router.showErrorDialog(error: error)
    }

    func goToMainScreen() {
        stopLoading()
        router.openMainScreen()
    }
}

