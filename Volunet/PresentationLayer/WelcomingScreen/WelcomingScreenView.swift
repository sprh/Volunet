//
//  WelcomingScreenView.swift
//  Volunet
//
//  Created by Софья Тимохина on 06.11.2021.
//

import UIKit

final class WelcomingScreenView: UIView {
    lazy var title: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "VOLUNET"
        label.textColor = .lightTeal
        label.font = .changaOneLargeTitle
        return label
    }()

    lazy var bottomSheet: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 20
        view.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        view.clipsToBounds = true
        return view
    }()

    lazy var welcomingPageImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.image = .welcomingPage
        return imageView
    }()

    lazy var registrationButton: UIButton = {
        let viewModel = MainButton.ViewModel(font: .preferredFont(forTextStyle: .body),
                                             title: .getLocalizedString(for: .registration),
                                             backgroundColor: .background,
                                             textColor: .text)
        let button = MainButton(viewModel: viewModel)
        button.isEnabled = true
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    lazy var alreadyHaveAccountLabel: UILabel = {
        let label = UILabel()
        label.text = .getLocalizedString(for: .alreadyHaveAccount)
        label.font = .preferredFont(forTextStyle: .callout)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .secondaryText
        return label
    }()

    lazy var signInButton: UIButton = {
        let viewModel = MainButton.ViewModel(font: .preferredFont(forTextStyle: .callout),
                                             title: nil,
                                             backgroundColor: .clear,
                                             textColor: .secondaryText)
        let button = MainButton(viewModel: viewModel)
        let underlineAttribute =
        [NSAttributedString.Key.underlineStyle: NSUnderlineStyle.thick.rawValue]
        let underlineAttributedString = NSAttributedString(string: .getLocalizedString(for: .signIn),
                                                           attributes: underlineAttribute)
        button.setAttributedTitle(underlineAttributedString, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.isEnabled = true
        return button
    }()
    
    func setup() {
        backgroundColor = .background
        addSubview(title)
        addSubview(bottomSheet)
        addSubview(welcomingPageImageView)
        bottomSheet.addSubview(registrationButton)
        bottomSheet.addSubview(alreadyHaveAccountLabel)
        bottomSheet.addSubview(signInButton)
        NSLayoutConstraint.activate([
            title.centerXAnchor.constraint(equalTo: centerXAnchor),
            title.topAnchor.constraint(equalTo: topAnchor, constant: 140),
            welcomingPageImageView.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 16),
            welcomingPageImageView.widthAnchor.constraint(equalToConstant: 230),
            welcomingPageImageView.centerXAnchor.constraint(equalTo: centerXAnchor),

            bottomSheet.bottomAnchor.constraint(equalTo: bottomAnchor),
            bottomSheet.leadingAnchor.constraint(equalTo: leadingAnchor),
            bottomSheet.trailingAnchor.constraint(equalTo: trailingAnchor),
            bottomSheet.heightAnchor.constraint(equalToConstant: 200),

            registrationButton.leadingAnchor.constraint(equalTo: bottomSheet.leadingAnchor, constant: 70),
            registrationButton.trailingAnchor.constraint(equalTo: bottomSheet.trailingAnchor, constant: -70),
            registrationButton.topAnchor.constraint(equalTo: bottomSheet.topAnchor, constant: 58),
            registrationButton.heightAnchor.constraint(equalToConstant: 50),

            alreadyHaveAccountLabel.centerXAnchor.constraint(equalTo: registrationButton.centerXAnchor),
            alreadyHaveAccountLabel.topAnchor.constraint(equalTo: registrationButton.bottomAnchor, constant: 8),

            signInButton.centerXAnchor.constraint(equalTo: registrationButton.centerXAnchor),
            signInButton.topAnchor.constraint(equalTo: alreadyHaveAccountLabel.bottomAnchor),
        ])
        layoutIfNeeded()
        bottomSheet.makeGradientBackground(with: [UIColor.darkTeal.cgColor, UIColor.lightTeal.cgColor])
    }
}
