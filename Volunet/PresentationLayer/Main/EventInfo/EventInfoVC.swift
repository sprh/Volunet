//
//  EventInfoScreenVC.swift
//  Volunet
//
//  Created by Софья Тимохина on 12.11.2021.
//

import UIKit

protocol IEventInfoScreenVC: UIViewController {

}

final class EventInfoScreenVC: UIViewController, IEventInfoScreenVC {
    private let interator: IEventInfoScreenInterator
    private let router: IEventInfoScreenRouter

    lazy var blurEffectView: UIVisualEffectView = {
        let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.light)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = view.bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        return blurEffectView
    }()

    lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()

    lazy var eventInfoStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.backgroundColor = .white
        stackView.layer.cornerRadius = 10
        return stackView
    }()

    lazy var closeButton: UIButton = {
        let closeButton = CloseButton(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
        closeButton.translatesAutoresizingMaskIntoConstraints = false
        closeButton.addTarget(self, action: #selector(close), for: .touchUpInside)
        return closeButton
    }()

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
        label.text = interator.eventTitle
        label.textAlignment = .center
        return label
    }()

    lazy var eventDescription: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .preferredFont(forTextStyle: .title3)
        label.text = interator.eventDescription
        return label
    }()

    lazy var avatarView: UIView = {
        let avatar = AvatarView(frame: CGRect(x: 0,
                                              y: 0,
                                              width: 60,
                                              height: 60),
                                image: .volunteerOrganizationPlaceholder)
        avatar.translatesAutoresizingMaskIntoConstraints = false
        return avatar
    }()

    lazy var eventOwnerName: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .preferredFont(forTextStyle: .title3)
        label.text = interator.eventOwner
        return label
    }()

    lazy var locationButton: MainButton = {
        let viewModel = MainButton.ViewModel(font: .preferredFont(forTextStyle: .title3),
                                             title: interator.eventLocation,
                                             backgroundColor: .lightTeal,
                                             textColor: .darkText)
        let button = MainButton(viewModel: viewModel)
        button.isEnabled = true
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    lazy var dateButton: UIButton = {
        let viewModel = MainButton.ViewModel(font: .preferredFont(forTextStyle: .title3),
                                             title: interator.eventDate,
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


    init(interator: IEventInfoScreenInterator,
         router: IEventInfoScreenRouter) {
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
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.navigationBar.isHidden = false
    }

    private func setup() {
        view.addSubview(blurEffectView)
        view.addSubview(closeButton)
        view.addSubview(eventInfoStackView)
        eventInfoStackView.addSubview(mainInfoView)
        mainInfoView.addSubview(eventTitle)
        mainInfoView.addSubview(eventDescription)
        eventInfoStackView.addSubview(avatarView)
        eventInfoStackView.addSubview(eventOwnerName)
        eventInfoStackView.addSubview(locationButton)
        eventInfoStackView.addSubview(dateButton)
        eventInfoStackView.addSubview(respondButton)

        NSLayoutConstraint.activate([
            closeButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            closeButton.widthAnchor.constraint(equalToConstant: 30),
            closeButton.heightAnchor.constraint(equalTo: closeButton.widthAnchor),
            closeButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),

            eventInfoStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            eventInfoStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            eventInfoStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),

            mainInfoView.leadingAnchor.constraint(equalTo: eventInfoStackView.leadingAnchor, constant: -2),
            mainInfoView.topAnchor.constraint(equalTo: eventInfoStackView.topAnchor),
            mainInfoView.trailingAnchor.constraint(equalTo: eventInfoStackView.trailingAnchor, constant: -4),

            eventTitle.topAnchor.constraint(equalTo: mainInfoView.topAnchor, constant: 16),
            eventTitle.leadingAnchor.constraint(equalTo: mainInfoView.leadingAnchor, constant: 16),
            eventTitle.trailingAnchor.constraint(equalTo: mainInfoView.trailingAnchor, constant: -16),

            eventDescription.topAnchor.constraint(equalTo: eventTitle.bottomAnchor, constant: 24),
            eventDescription.leadingAnchor.constraint(equalTo: eventTitle.leadingAnchor),
            eventDescription.trailingAnchor.constraint(equalTo: eventTitle.trailingAnchor),
            eventDescription.bottomAnchor.constraint(equalTo: mainInfoView.bottomAnchor, constant: -40),

            avatarView.leadingAnchor.constraint(equalTo: eventInfoStackView.leadingAnchor, constant: 10),
            avatarView.widthAnchor.constraint(equalToConstant: 60),
            avatarView.heightAnchor.constraint(equalTo: avatarView.widthAnchor),
            avatarView.topAnchor.constraint(equalTo: mainInfoView.bottomAnchor, constant: -24),

            eventOwnerName.leadingAnchor.constraint(equalTo: avatarView.trailingAnchor, constant: 10),
            eventOwnerName.topAnchor.constraint(equalTo: mainInfoView.bottomAnchor, constant: 5),
            eventOwnerName.trailingAnchor.constraint(equalTo: eventInfoStackView.trailingAnchor, constant: -16),

            locationButton.topAnchor.constraint(equalTo: avatarView.bottomAnchor, constant: 14),
            locationButton.leadingAnchor.constraint(equalTo: eventInfoStackView.leadingAnchor, constant: 16),
            locationButton.trailingAnchor.constraint(equalTo: eventInfoStackView.trailingAnchor, constant: -16),
            locationButton.heightAnchor.constraint(equalToConstant: 55),

            dateButton.topAnchor.constraint(equalTo: locationButton.bottomAnchor, constant: 14),
            dateButton.leadingAnchor.constraint(equalTo: eventInfoStackView.leadingAnchor, constant: 16),
            dateButton.trailingAnchor.constraint(equalTo: eventInfoStackView.trailingAnchor, constant: -16),
            dateButton.heightAnchor.constraint(equalToConstant: 55),

            respondButton.topAnchor.constraint(equalTo: dateButton.bottomAnchor, constant: 16),
            respondButton.trailingAnchor.constraint(equalTo: eventInfoStackView.trailingAnchor, constant: -16),
            respondButton.heightAnchor.constraint(equalToConstant: 55),
            respondButton.bottomAnchor.constraint(equalTo: eventInfoStackView.bottomAnchor, constant: 27),
            respondButton.leadingAnchor.constraint(equalTo: eventInfoStackView.centerXAnchor, constant: -16)
        ])
    }

    @objc
    private func close() {
        dismiss(animated: false)
    }
}
