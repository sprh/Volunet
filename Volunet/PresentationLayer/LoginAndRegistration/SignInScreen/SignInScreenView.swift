//
//  SignInScreenView.swift
//  Volunet
//
//  Created by Софья Тимохина on 08.03.2022.
//

import UIKit

final class SignInScreenView: UIView {
    lazy var emailTextField: UITextField = {
        let textField = TextFieldWithPadding()
        textField.keyboardType = .emailAddress
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = .getLocalizedString(for: .email)
        textField.backgroundColor = .background
        textField.textColor = .text
        textField.layer.cornerRadius = 16
        return textField
    }()

    lazy var passwordTextField: UITextField = {
        let textField = TextFieldWithPadding()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.isSecureTextEntry = true
        textField.placeholder = .getLocalizedString(for: .password)
        textField.backgroundColor = .background
        textField.textColor = .text
        textField.layer.cornerRadius = 16
        textField.becomeFirstResponder()
        return textField
    }()

    lazy var signInButton: UIButton = {
        let viewModel = MainButton.ViewModel(font: .preferredFont(forTextStyle: .body),
                                             title: .getLocalizedString(for: .signIn),
                                             enabledBackgroundColor: .lightTeal,
                                             disabledBackground: .darkTeal,
                                             enabledTextColor: .secondaryText,
                                             // TODO: change
                                             disabledTextColor: .secondaryText)
        let button = MainButton(viewModel: viewModel)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.isEnabled = false
        return button
    }()

    private lazy var title: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "VOLUNET"
        label.font = .changaOneTitle
        label.textColor = .lightTeal
        return label
    }()

    private lazy var personalDataPanel: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 70
        view.layer.maskedCorners = [.layerMaxXMinYCorner,
                                    .layerMinXMinYCorner,
                                    .layerMaxXMaxYCorner]
        view.clipsToBounds = true
        return view
    }()

    private lazy var helloLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = .getLocalizedString(for: .gladToSeeYouAgain)
        label.font = .preferredFont(forTextStyle: .title3)
        label.textColor = .secondaryText
        return label
    }()

    private lazy var personalDataStack: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()

    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.alwaysBounceVertical = true
        scrollView.isScrollEnabled = true
        return scrollView
    }()

    func setup() {
        backgroundColor = .background
        addSubview(scrollView)
        addSubview(signInButton)

        scrollView.addSubview(title)
        scrollView.addSubview(personalDataPanel)

        personalDataPanel.addSubview(personalDataStack)
        personalDataStack.addSubview(helloLabel)
        personalDataStack.addSubview(emailTextField)
        personalDataStack.addSubview(passwordTextField)

        NSLayoutConstraint.activate([
            scrollView.leadingAnchor.constraint(equalTo: leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: trailingAnchor),
            scrollView.topAnchor.constraint(equalTo: topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: bottomAnchor),

            title.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 65),
            title.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),

            personalDataPanel.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 35),
            personalDataPanel.leadingAnchor.constraint(equalTo: scrollView.safeAreaLayoutGuide.leadingAnchor, constant: 15),
            personalDataPanel.trailingAnchor.constraint(equalTo: scrollView.safeAreaLayoutGuide.trailingAnchor, constant: -15),

            personalDataStack.leadingAnchor.constraint(equalTo: personalDataPanel.leadingAnchor),
            personalDataStack.trailingAnchor.constraint(equalTo: personalDataPanel.trailingAnchor),
            personalDataStack.topAnchor.constraint(equalTo: personalDataPanel.topAnchor),
            personalDataStack.bottomAnchor.constraint(equalTo: personalDataPanel.bottomAnchor, constant: -26),

            helloLabel.topAnchor.constraint(equalTo: personalDataStack.topAnchor, constant: 45),
            helloLabel.centerXAnchor.constraint(equalTo: personalDataStack.centerXAnchor),

            emailTextField.topAnchor.constraint(equalTo: helloLabel.bottomAnchor, constant: 19),
            emailTextField.leadingAnchor.constraint(equalTo: personalDataStack.leadingAnchor, constant: 16),
            emailTextField.trailingAnchor.constraint(equalTo: personalDataStack.trailingAnchor, constant: -16),
            emailTextField.heightAnchor.constraint(equalToConstant: 42),

            passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 9),
            passwordTextField.leadingAnchor.constraint(equalTo: personalDataStack.leadingAnchor, constant: 16),
            passwordTextField.trailingAnchor.constraint(equalTo: personalDataStack.trailingAnchor, constant: -16),
            passwordTextField.heightAnchor.constraint(equalToConstant: 42),
            passwordTextField.bottomAnchor.constraint(equalTo: personalDataStack.bottomAnchor, constant: -16),


            signInButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 70),
            signInButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -70),
            signInButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -50),
            signInButton.heightAnchor.constraint(equalToConstant: 55),
        ])
        layoutIfNeeded()
        personalDataPanel.makeGradientBackground(with: [UIColor.lightTeal.cgColor,
                                                        UIColor.darkTeal.cgColor])
        scrollView.setContentSize()
    }
}

