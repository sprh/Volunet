//
//  NewEventScreenVC.swift
//  Volunet
//
//  Created by Софья Тимохина on 12.11.2021.
//

import UIKit

protocol INewEventScreenVC: UIViewController {

}

final class NewEventScreenVC: UIViewController, INewEventScreenVC {
    private let interator: INewEventScreenInterator
    private let router: INewEventScreenRouter

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

    lazy var eventInfoView: NewEventView = {
        let view = NewEventView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    lazy var closeButton: UIButton = {
        let closeButton = CloseButton(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
        closeButton.translatesAutoresizingMaskIntoConstraints = false
        closeButton.addTarget(self, action: #selector(close), for: .touchUpInside)
        return closeButton
    }()

    init(interator: INewEventScreenInterator,
         router: INewEventScreenRouter) {
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
        eventInfoView.setup()

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
        addTargets()
    }

    private func addTargets() {
        eventInfoView.fromDate.addTarget(self, action: #selector(formDatePickerChanged), for: .valueChanged)
        eventInfoView.toDate.addTarget(self, action: #selector(toDatePickerChanged), for: .valueChanged)
        eventInfoView.eventDescription.delegate = self
        eventInfoView.location.delegate = self
        eventInfoView.eventName.delegate = self
    }

    @objc
    private func close() {
        router.close()
    }

    @objc
    private func onTapRespond() {
        router.onTapRespond()
    }

    @objc
    private func formDatePickerChanged() {
        if (eventInfoView.fromDate.date > eventInfoView.toDate.date) {
            eventInfoView.toDate.setDate(eventInfoView.fromDate.date, animated: true)
            eventInfoView.toDate.minimumDate = eventInfoView.fromDate.date
        } else {
            eventInfoView.fromDate.minimumDate = min(eventInfoView.fromDate.date, .tomorrow)
        }
    }

    @objc
    private func toDatePickerChanged() {
        if (eventInfoView.toDate.date < eventInfoView.fromDate.date) {
            eventInfoView.toDate.setDate(eventInfoView.toDate.date, animated: true)
        }
    }
}

extension NewEventScreenVC: UITextViewDelegate {
    func textViewDidChange(_ textView: UITextView) {
        if (eventInfoView.location.text?.isEmpty ?? true ||
            eventInfoView.eventName.text?.isEmpty ?? true ||
            eventInfoView.eventDescription.text?.isEmpty ?? true
        ) {
            eventInfoView.addEventButton.isEnabled = false
        } else {
            eventInfoView.addEventButton.isEnabled = true
        }
    }
}
