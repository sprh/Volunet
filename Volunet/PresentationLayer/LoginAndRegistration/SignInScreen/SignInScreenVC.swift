//
//  SignInScreenVC.swift
//  Volunet
//
//  Created by Софья Тимохина on 11.11.2021.
//

import UIKit

protocol ISignInScreenVC: UIViewController {
    func goToMainScreen()
    func showErrorDialog(error: String)
}

final class SignInScreenVC: UIViewController, ISignInScreenVC {
    private let interator: ISignInScreenInterator
    private let router: ISignInScreenRouter

    lazy var signInScreenView: SignInScreenView = {
        let view = SignInScreenView()
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

    init(interator: ISignInScreenInterator,
         router: ISignInScreenRouter) {
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
        view.addSubview(signInScreenView)
        NSLayoutConstraint.activate([
            signInScreenView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            signInScreenView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            signInScreenView.topAnchor.constraint(equalTo: view.topAnchor),
            signInScreenView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
        signInScreenView.setup()
    }

    private func addTargets() {
        signInScreenView.signInButton.addTarget(self,
                                                    action: #selector(didTapSignInButton),
                                                    for: .touchUpInside)
        signInScreenView.emailTextField.addTarget(self,
                                                       action: #selector(textFieldDidChange),
                                                       for: .editingChanged)
        signInScreenView.passwordTextField.addTarget(self,
                                                       action: #selector(textFieldDidChange),
                                                       for: .editingChanged)

    }



    @objc
    func didTabBackButton() {
        router.goBack()
    }

    @objc
    func textFieldDidChange() {
        if (signInScreenView.emailTextField.text?.isEmpty ?? true ||
            signInScreenView.passwordTextField.text?.isEmpty ?? true) {
            signInScreenView.signInButton.isEnabled = false
        } else {
            signInScreenView.signInButton.isEnabled = true
        }
    }

    @objc
    func didTapSignInButton() {
        let email = signInScreenView.emailTextField.text
        let password = signInScreenView.passwordTextField.text
        guard let email = email, let password = password, !password.isEmpty, !email.isEmpty else {
            return
        }
        signInScreenView.signInButton.startAnimation()
        backButton.isEnabled = false
        interator.onTapSignIn(email: email, password: password)
    }

    func stopLoading() {
        signInScreenView.signInButton.stopAnimation()
        backButton.isEnabled = true
    }

    func goToMainScreen() {
        stopLoading()
        router.openMainScreen()
    }

    func showErrorDialog(error: String) {
        stopLoading()
        router.showErrorDialog(error: error)
    }
}

