//
//  AnotherProfileInfoView.swift
//  Volunet
//
//  Created by Софья Тимохина on 25.04.2022.
//

import UIKit

class AnotherProfileInfoView: UIView {
    lazy var profile = Mocks.sashaProfile

    lazy var name: UILabel = {
        let label = UILabel()
        label.text = profile.name
        label.font = .preferredFont(forTextStyle: .title1)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    lazy var organization: UILabel = {
        let label = UILabel()
        label.text = "Мосволонтер"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .preferredFont(forTextStyle: .title2)
        return label
    }()

    lazy var profileImage: UIButton = {
        let image = RoundedImageView(frame: CGRect(x: 0,
                                                          y: 0,
                                                          width: 100,
                                                          height: 100), image: .volunteerOrganizationPlaceholder)
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
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

    public func setup() {
        for event in profile.events {
            let eventInfoView = UserEventInfoView()
            eventsStackView.addArrangedSubview(eventInfoView)
            eventInfoView.setup(event: event)
        }
        backgroundColor = .lightTeal
        layer.cornerRadius = 20

        addSubview(name)
        addSubview(organization)
        addSubview(profileImage)
        addSubview(eventsStackView)

        NSLayoutConstraint.activate([
            profileImage.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            profileImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            profileImage.heightAnchor.constraint(equalToConstant: 100),
            profileImage.widthAnchor.constraint(equalToConstant: 100),

            name.leadingAnchor.constraint(equalTo: profileImage.trailingAnchor, constant: 16),
            name.topAnchor.constraint(equalTo: topAnchor, constant: 10),

            organization.topAnchor.constraint(equalTo: name.bottomAnchor, constant: 5),
            organization.leadingAnchor.constraint(equalTo: profileImage.trailingAnchor, constant: 16),

            eventsStackView.topAnchor.constraint(equalTo: profileImage.bottomAnchor, constant: 16),
            eventsStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            eventsStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            eventsStackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16)
        ])
    }
}
