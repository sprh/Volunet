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
        scrollView.alwaysBounceVertical = true
        return scrollView
    }()

    lazy var eventInfoView: EventInfoView = {
        let view = EventInfoView(frame: .zero,
                                 location: interator.eventLocation,
                                 date: interator.eventDate,
                                 title: interator.eventTitle,
                                 description: interator.eventDescription,
                                 avatar: .volunteerOrganizationPlaceholder,  // TODO: change
                                 ownerName: interator.eventOwner)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    lazy var closeButton: UIButton = {
        let closeButton = CloseButton(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
        closeButton.translatesAutoresizingMaskIntoConstraints = false
        closeButton.addTarget(self, action: #selector(close), for: .touchUpInside)
        return closeButton
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

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        navigationController?.navigationBar.isHidden = false
    }

    private func setup() {
        view.addSubview(blurEffectView)
        view.addSubview(scrollView)
        scrollView.addSubview(eventInfoView)
        view.addSubview(closeButton)

        NSLayoutConstraint.activate([
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),

            eventInfoView.leadingAnchor.constraint(equalTo: scrollView.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            eventInfoView.trailingAnchor.constraint(equalTo: scrollView.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            eventInfoView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 16 + UIViewController.topSafeAreaHeight),

            closeButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            closeButton.widthAnchor.constraint(equalToConstant: 30),
            closeButton.heightAnchor.constraint(equalTo: closeButton.widthAnchor),
            closeButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
        ])
        view.layoutIfNeeded()
        scrollView.setContentSize()

        eventInfoView.respondButton.addTarget(self, action: #selector(onTapRespond), for: .touchUpInside)
    }

    @objc
    private func close() {
        router.close()
    }

    @objc
    private func onTapRespond() {
        router.onTapRespond()
    }
}
