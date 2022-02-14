//
//  ProfileScreenView.swift
//  Volunet
//
//  Created by Софья Тимохина on 03.02.2022.
//

import UIKit

final class ProfileScreenView: UIView {
    lazy var name: UILabel = {
        let label = UILabel()
        label.font = .preferredFont(forTextStyle: .title1).makeBold()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .whiteTeal
        return label
    }()

    lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.alwaysBounceVertical = true
        scrollView.alwaysBounceHorizontal = true
        return scrollView
    }()

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
        let avatar = RoundedImageView(frame: CGRect(x: 0,
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
                                             title: .getLocalizedString(for: .logout),
                                             backgroundColor: .darkTeal,
                                             textColor: .white)
        let button = MainButton(viewModel: viewModel)
        button.isEnabled = true
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    func setup(with profile: Profile) {
        name.text = "\(profile.firstName) \(profile.lastName)"

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
        
        addSubview(name)
        addSubview(profilePanel)
        addSubview(profileImage)
        profilePanel.addSubview(scrollView)
        scrollView.addSubview(backButton)
        scrollView.addSubview(healthInfoStackView)
        scrollView.addSubview(eventsLabel)
        scrollView.addSubview(eventsStackView)
        scrollView.addSubview(logoutButton)
        
        
        NSLayoutConstraint.activate([
            profileImage.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            profileImage.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
            profileImage.heightAnchor.constraint(equalToConstant: 100),
            profileImage.widthAnchor.constraint(equalToConstant: 100),

            name.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            name.bottomAnchor.constraint(equalTo: profilePanel.topAnchor, constant: -8),
            
            profilePanel.leadingAnchor.constraint(equalTo: leadingAnchor),
            profilePanel.trailingAnchor.constraint(equalTo: trailingAnchor),
            profilePanel.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            profilePanel.topAnchor.constraint(equalTo: profileImage.centerYAnchor),

            backButton.leadingAnchor.constraint(equalTo: scrollView.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            backButton.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 16),

            scrollView.leadingAnchor.constraint(equalTo: profilePanel.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: profilePanel.trailingAnchor),
            scrollView.topAnchor.constraint(equalTo: profilePanel.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: profilePanel.bottomAnchor),

            healthInfoStackView.leadingAnchor.constraint(equalTo: scrollView.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            healthInfoStackView.trailingAnchor.constraint(equalTo: scrollView.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            healthInfoStackView.topAnchor.constraint(equalTo: backButton.bottomAnchor, constant: 16),

            eventsLabel.leadingAnchor.constraint(equalTo: scrollView.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            eventsLabel.trailingAnchor.constraint(equalTo: scrollView.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            eventsLabel.topAnchor.constraint(equalTo: healthInfoStackView.bottomAnchor, constant: 16),

            eventsStackView.leadingAnchor.constraint(equalTo: scrollView.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            eventsStackView.trailingAnchor.constraint(equalTo: scrollView.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            eventsStackView.topAnchor.constraint(equalTo: eventsLabel.bottomAnchor, constant: 16),

            logoutButton.leadingAnchor.constraint(equalTo: scrollView.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            logoutButton.trailingAnchor.constraint(equalTo: scrollView.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            logoutButton.topAnchor.constraint(equalTo: eventsStackView.bottomAnchor, constant: 16),
            logoutButton.heightAnchor.constraint(equalToConstant: 55),
            logoutButton.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor)
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
