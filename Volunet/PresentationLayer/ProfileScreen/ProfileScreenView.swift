//
//  ProfileScreenView.swift
//  Volunet
//
//  Created by Софья Тимохина on 03.02.2022.
//

import UIKit

final class ProfileScreenView: UIView {
    lazy var profilePanel: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 50
        view.layer.maskedCorners = [.layerMaxXMinYCorner,
                                    .layerMinXMinYCorner]
        view.clipsToBounds = true
        return view
    }()
    
    lazy var profileImage: UIView = {
        let avatar = AvatarView(frame: CGRect(x: 0,
                                              y: 0,
                                              width: 100,
                                              height: 100),
                                image: UIImage.volunteerOrganizationPlaceholder) // TODO: change
        avatar.translatesAutoresizingMaskIntoConstraints = false
        return avatar
    }()
    
    lazy var backButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        let imageView = UIImageView(frame: CGRect(x: 10, y: 10, width: 20, height: 20))
        imageView.image = .chevronLeft.withTintColor(.white)
        button.addSubview(imageView)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var healthInfoStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.spacing = 5
        stackView.distribution = .fillEqually
        stackView.isLayoutMarginsRelativeArrangement = true
        return stackView
    }()

    lazy var eventsLabel: UILabel = {
        let label = UILabel()
        label.font = .preferredFont(forTextStyle: .title1).makeBold()
        label.text = .getLocalizedString(for: .events)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .whiteTeal
        return label
    }()

    lazy var eventsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.spacing = 5
        stackView.distribution = .fillEqually
        stackView.isLayoutMarginsRelativeArrangement = true
        return stackView
    }()

    lazy var logoutButton: UIButton = {
        let viewModel = MainButton.ViewModel(font: .preferredFont(forTextStyle: .title1),
                                             title: "Выйти",
                                             backgroundColor: .darkTeal,
                                             textColor: .white)
        let button = MainButton(viewModel: viewModel)
        button.isEnabled = true
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    func setup(with profile: Profile) {
        addSubview(profilePanel)
        addSubview(profileImage)
        addSubview(healthInfoStackView)
        addSubview(eventsLabel)
        addSubview(eventsStackView)
        addSubview(logoutButton)
        profilePanel.addSubview(backButton)
        
        for specialHealthFeature in profile.specialHealthFeatures {
            let healthView = SpecialHealthFeatureView()
            healthInfoStackView.addArrangedSubview(healthView)
            healthView.setup(name: specialHealthFeature,
                             onUpdate: onUpdateHealthFeature(_:),
                             trailingIcon: UIImage.edit)
        }

        for event in profile.events {
            let eventInfoView = UserEventInfoView()
            eventsStackView.addArrangedSubview(eventInfoView)
            eventInfoView.setup(event: event)
        }
        
        
        NSLayoutConstraint.activate([
            profileImage.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            profileImage.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
            profileImage.heightAnchor.constraint(equalToConstant: 100),
            profileImage.widthAnchor.constraint(equalToConstant: 100),
            
            profilePanel.leadingAnchor.constraint(equalTo: leadingAnchor),
            profilePanel.trailingAnchor.constraint(equalTo: trailingAnchor),
            profilePanel.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            profilePanel.topAnchor.constraint(equalTo: profileImage.centerYAnchor),
            
            backButton.leadingAnchor.constraint(equalTo: profilePanel.leadingAnchor, constant: 16),
            backButton.topAnchor.constraint(equalTo: profilePanel.topAnchor, constant: 16),
            
            healthInfoStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            healthInfoStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            healthInfoStackView.topAnchor.constraint(equalTo: backButton.bottomAnchor, constant: 16),

            eventsLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            eventsLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            eventsLabel.topAnchor.constraint(equalTo: healthInfoStackView.bottomAnchor, constant: 16),

            eventsStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            eventsStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            eventsStackView.topAnchor.constraint(equalTo: eventsLabel.bottomAnchor, constant: 16),

            logoutButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            logoutButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            logoutButton.topAnchor.constraint(equalTo: eventsStackView.bottomAnchor, constant: 16),
            logoutButton.heightAnchor.constraint(equalToConstant: 55)
        ])
        
        layoutIfNeeded()
        makeGradientBackground(with: [UIColor.teal.cgColor,
                                      UIColor.darkTeal.cgColor])
        profilePanel.makeGradientBackground(with: [UIColor.lightTeal.cgColor,
                                                   UIColor.lightGreen.cgColor])
    }
    
    func onUpdateHealthFeature(_ name: String) {
        
    }
}
