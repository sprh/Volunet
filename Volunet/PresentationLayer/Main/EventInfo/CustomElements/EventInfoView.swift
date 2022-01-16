//
//  EventInfoView.swift
//  Volunet
//
//  Created by Софья Тимохина on 16.01.2022.
//

import UIKit

final class EventInfoView: UIStackView {
    let location: String
    let date: String
    let title: String
    let descriptionString: String
    let avatar: UIImage

    init(frame: CGRect,
         location: String,
         date: String,
         title: String,
         description: String,
         avatar: UIImage) {
        self.location = location
        self.date = date
        self.title = title
        self.descriptionString = description
        self.avatar = avatar
        super.init(frame: frame)
        setup()
    }

    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    lazy var mainInfoView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.layer.cornerRadius = 10
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOpacity = 1
        view.layer.shadowOffset = .zero
        view.layer.shadowRadius = view.layer.cornerRadius
        return view
    }()

    lazy var eventTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .preferredFont(forTextStyle: .title3)
        label.textAlignment = .center
        label.text = title
        label.numberOfLines = 0
        return label
    }()

    lazy var eventDescription: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .preferredFont(forTextStyle: .title3)
        label.text = descriptionString
        label.numberOfLines = 0
        return label
    }()

    lazy var avatarView: UIView = {
        let avatar = AvatarView(frame: CGRect(x: 0,
                                              y: 0,
                                              width: 60,
                                              height: 60),
                                image: avatar)
        avatar.translatesAutoresizingMaskIntoConstraints = false
        return avatar
    }()

    lazy var eventOwnerName: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .preferredFont(forTextStyle: .title3)
        return label
    }()

    lazy var locationButton: MainButton = {
        let viewModel = MainButton.ViewModel(font: .preferredFont(forTextStyle: .title3),
                                             title: location,
                                             backgroundColor: .lightTeal,
                                             textColor: .darkText)
        let button = MainButton(viewModel: viewModel)
        button.isEnabled = true
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    lazy var dateButton: UIButton = {
        let viewModel = MainButton.ViewModel(font: .preferredFont(forTextStyle: .title3),
                                             title: date,
                                             backgroundColor: .lightTeal,
                                             textColor: .darkText)
        let button = MainButton(viewModel: viewModel)
        button.isEnabled = true
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    lazy var respondButton: UIButton = {
        let viewModel = MainButton.ViewModel(font: .preferredFont(forTextStyle: .title3),
                                             title: .getLocalizedString(for: .respond),
                                             backgroundColor: .lightGreen,
                                             textColor: .darkText)
        let button = MainButton(viewModel: viewModel)
        button.isEnabled = true
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private func setup() {
        backgroundColor = .white
        layer.cornerRadius = 10
        addSubview(mainInfoView)
        mainInfoView.addSubview(eventTitle)
        mainInfoView.addSubview(eventDescription)
        addSubview(avatarView)
        addSubview(eventOwnerName)
        addSubview(locationButton)
        addSubview(dateButton)
        addSubview(respondButton)

        NSLayoutConstraint.activate([
            mainInfoView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: -2),
            mainInfoView.topAnchor.constraint(equalTo: topAnchor),
            mainInfoView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -4),

            eventTitle.topAnchor.constraint(equalTo: mainInfoView.topAnchor, constant: 16),
            eventTitle.leadingAnchor.constraint(equalTo: mainInfoView.leadingAnchor, constant: 16),
            eventTitle.trailingAnchor.constraint(equalTo: mainInfoView.trailingAnchor, constant: -16),

            eventDescription.topAnchor.constraint(equalTo: eventTitle.bottomAnchor, constant: 24),
            eventDescription.leadingAnchor.constraint(equalTo: eventTitle.leadingAnchor),
            eventDescription.trailingAnchor.constraint(equalTo: eventTitle.trailingAnchor),
            eventDescription.bottomAnchor.constraint(equalTo: mainInfoView.bottomAnchor, constant: -40),

            avatarView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            avatarView.widthAnchor.constraint(equalToConstant: 60),
            avatarView.heightAnchor.constraint(equalTo: avatarView.widthAnchor),
            avatarView.topAnchor.constraint(equalTo: mainInfoView.bottomAnchor, constant: -24),

            eventOwnerName.leadingAnchor.constraint(equalTo: avatarView.trailingAnchor, constant: 10),
            eventOwnerName.topAnchor.constraint(equalTo: mainInfoView.bottomAnchor, constant: 5),
            eventOwnerName.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),

            locationButton.topAnchor.constraint(equalTo: avatarView.bottomAnchor, constant: 14),
            locationButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            locationButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            locationButton.heightAnchor.constraint(equalToConstant: 55),

            dateButton.topAnchor.constraint(equalTo: locationButton.bottomAnchor, constant: 14),
            dateButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            dateButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            dateButton.heightAnchor.constraint(equalToConstant: 55),

            respondButton.topAnchor.constraint(equalTo: dateButton.bottomAnchor, constant: 16),
            respondButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            respondButton.heightAnchor.constraint(equalToConstant: 55),
            respondButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 27),
            respondButton.leadingAnchor.constraint(equalTo: centerXAnchor, constant: -16)
        ])
    }
}

