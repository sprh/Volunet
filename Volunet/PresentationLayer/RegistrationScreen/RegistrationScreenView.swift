//
//  RegistrationScreenView.swift
//  Volunet
//
//  Created by Софья Тимохина on 11.11.2021.
//

import UIKit

final class RegistrationScreenView: UIView {
    lazy var title: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "VOLUNET"
        label.font = .changaOneTitle
        label.textColor = .lightTeal
        return label
    }()

    lazy var personalDataPanel: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 70
        view.layer.maskedCorners = [.layerMaxXMinYCorner,
                                    .layerMinXMinYCorner,
                                    .layerMaxXMaxYCorner]
        view.clipsToBounds = true
        view.backgroundColor = .red
        return view
    }()

    lazy var joinButton: UIButton = {
        let viewModel = MainButton.ViewModel(font: .preferredFont(forTextStyle: .body),
                                             title: .getLocalizedString(for: .join),
                                             enabledBackgroundColor: .lightTeal,
                                             disabledBackground: .darkTeal,
                                             enabledTextColor: .secondaryText,
                                             // TODO change
                                             disabledTextColor: .secondaryText)
        let button = MainButton(viewModel: viewModel)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.isEnabled = false
        return button
    }()

    func setup() {
        backgroundColor = .background
        addSubview(title)
        addSubview(personalDataPanel)
        addSubview(joinButton)
        NSLayoutConstraint.activate([
            title.topAnchor.constraint(equalTo: topAnchor, constant: 65),
            title.centerXAnchor.constraint(equalTo: centerXAnchor),

            joinButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 70),
            joinButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -70),
            joinButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -50),
            joinButton.heightAnchor.constraint(equalToConstant: 55),

            personalDataPanel.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 35),
            personalDataPanel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            personalDataPanel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            personalDataPanel.bottomAnchor.constraint(equalTo: joinButton.topAnchor, constant: -27)
        ])
        layoutIfNeeded()
        personalDataPanel.makeGradientBackground(with: [UIColor.darkTeal.cgColor, UIColor.lightTeal.cgColor])
    }
}
