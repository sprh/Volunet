//
//  RegistrationScreenView.swift
//  Volunet
//
//  Created by Софья Тимохина on 11.11.2021.
//

import UIKit

final class RegistrationScreenView: UIView {
    lazy var nameTextField: UITextField = {
        let textField = TextFieldWithPadding()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = .getLocalizedString(for: .name)
        textField.backgroundColor = .background
        textField.textColor = .text
        textField.layer.cornerRadius = 16
        textField.becomeFirstResponder()
        return textField
    }()

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

    lazy var joinButton: UIButton = {
        let viewModel = MainButton.ViewModel(font: .preferredFont(forTextStyle: .body),
                                             title: .getLocalizedString(for: .join),
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

    private lazy var welcomeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = .getLocalizedString(for: .welcome)
        label.font = .preferredFont(forTextStyle: .title3)
        label.textColor = .secondaryText
        return label
    }()

    lazy var roleSegmentedControl: UISegmentedControl = {
        let segmentedControl = UISegmentedControl(items: [String.getLocalizedString(for: .volunteer),
                                                          String.getLocalizedString(for: .volunteerOrganization)])
        segmentedControl.backgroundColor = .lightTeal
        segmentedControl.selectedSegmentTintColor = .darkTeal
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        segmentedControl.tintColor = .secondaryText
        segmentedControl.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.secondaryText],
                                                for: .selected)
        segmentedControl.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.text],
                                                for: .normal)
        segmentedControl.selectedSegmentIndex = 0
        return segmentedControl
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
        addSubview(joinButton)

        scrollView.addSubview(title)
        scrollView.addSubview(personalDataPanel)

        personalDataPanel.addSubview(personalDataStack)
        personalDataStack.addSubview(welcomeLabel)
        personalDataStack.addSubview(nameTextField)
        personalDataStack.addSubview(emailTextField)
        personalDataStack.addSubview(passwordTextField)
        personalDataStack.addSubview(roleSegmentedControl)

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

            welcomeLabel.topAnchor.constraint(equalTo: personalDataStack.topAnchor, constant: 45),
            welcomeLabel.centerXAnchor.constraint(equalTo: personalDataStack.centerXAnchor),

            nameTextField.topAnchor.constraint(equalTo: welcomeLabel.bottomAnchor, constant: 19),
            nameTextField.leadingAnchor.constraint(equalTo: personalDataStack.leadingAnchor, constant: 16),
            nameTextField.trailingAnchor.constraint(equalTo: personalDataStack.trailingAnchor, constant: -16),
            nameTextField.heightAnchor.constraint(equalToConstant: 42),

            emailTextField.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 9),
            emailTextField.leadingAnchor.constraint(equalTo: personalDataStack.leadingAnchor, constant: 16),
            emailTextField.trailingAnchor.constraint(equalTo: personalDataStack.trailingAnchor, constant: -16),
            emailTextField.heightAnchor.constraint(equalToConstant: 42),

            passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 9),
            passwordTextField.leadingAnchor.constraint(equalTo: personalDataStack.leadingAnchor, constant: 16),
            passwordTextField.trailingAnchor.constraint(equalTo: personalDataStack.trailingAnchor, constant: -16),
            passwordTextField.heightAnchor.constraint(equalToConstant: 42),

            roleSegmentedControl.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 19),
            roleSegmentedControl.centerXAnchor.constraint(equalTo: personalDataStack.centerXAnchor),
            roleSegmentedControl.bottomAnchor.constraint(equalTo: personalDataStack.bottomAnchor, constant: -16),


            joinButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 70),
            joinButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -70),
            joinButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -50),
            joinButton.heightAnchor.constraint(equalToConstant: 55),
        ])
        layoutIfNeeded()
        personalDataPanel.makeGradientBackground(with: [UIColor.lightTeal.cgColor,
                                                        UIColor.darkTeal.cgColor])
        scrollView.setContentSize()
    }
}
