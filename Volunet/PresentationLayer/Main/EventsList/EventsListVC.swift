//
//  EventsListScreenVC.swift
//  Volunet
//
//  Created by Софья Тимохина on 12.11.2021.
//

import UIKit

protocol IEventsListScreenVC: UIViewController {
    func onLoadingError(error: String)
    func onLoadEvents()
}

final class EventsListScreenVC: UIViewController, IEventsListScreenVC {
    private let interator: IEventsListScreenInterator
    private let router: IEventsListScreenRouter

    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: view.frame, style: .insetGrouped)
        tableView.backgroundColor = .clear
        tableView.register(EventCell.self, forCellReuseIdentifier: "\(EventCell.self)")
        tableView.register(LoadingTableViewCell.self, forCellReuseIdentifier: "\(LoadingTableViewCell.self)")
        tableView.register(NewEventCell.self, forCellReuseIdentifier: "\(NewEventCell.self)")
        tableView.delegate = self
        tableView.dataSource = self
        tableView.alwaysBounceVertical = true
        tableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 50, right: 0)
        return tableView
    }()

    lazy var tableViewHeaderView: UIView = {
        let view = UIView()
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = .getLocalizedString(for: .whatGoodTodayQuestion)
        label.font = .preferredFont(forTextStyle: .largeTitle)
        label.numberOfLines = 4
        label.textColor = .secondaryText
        view.addSubview(label)
        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            label.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            label.topAnchor.constraint(equalTo: view.topAnchor, constant: 16),
            label.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -16),
        ])
        return view
    }()

    init(interator: IEventsListScreenInterator,
         router: IEventsListScreenRouter) {
        self.interator = interator
        self.router = router
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.makeGradientBackground(with: [UIColor.lightTeal.cgColor,
                                           UIColor.darkTeal.cgColor])
        view.addSubview(tableView)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        navigationController?.navigationBar.isHidden = false
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        interator.loadEvents()
    }

    func onLoadingError(error: String) {
        router.showErrorDialog(error: error)
    }

    func onLoadEvents() {
        tableView.reloadData()
    }

    @objc
    func onTapImage() {
        router.onTapImage()
    }
}

extension EventsListScreenVC: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        let count = interator.eventsCount
        if (interator.loading) {
            return count + 1
        } else if (interator.organization) {
            return count + 1
        }
        return count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if (interator.loading && indexPath.row == interator.eventsCount) {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "\(LoadingTableViewCell.self)") as? LoadingTableViewCell else {
                return UITableViewCell()
            }
            cell.setup()
            return cell
        }

        if (indexPath.section == 0 && interator.organization) {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "\(NewEventCell.self)") as? NewEventCell else {
                return UITableViewCell()
            }
            cell.setup()
            return cell
        }

        guard let cell = tableView.dequeueReusableCell(withIdentifier: "\(EventCell.self)") as? EventCell,
              let event = interator.getEvent(at: indexPath.section - (interator.organization ? 1 : 0)) else { return UITableViewCell() }
        cell.setup(with: event)
        cell.ownerAvatar.addTarget(self, action: #selector(onTapImage), for: .touchUpInside)
        return cell
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard section == 0 else { return nil }
        let view = UIView()
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = .getLocalizedString(for: .whatGoodTodayQuestion)
        label.font = .preferredFont(forTextStyle: .largeTitle)
        label.numberOfLines = 4
        label.textColor = .secondaryText
        view.addSubview(label)
        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            label.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            label.topAnchor.constraint(equalTo: view.topAnchor, constant: 16),
            label.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -40),
        ])
        return tableViewHeaderView
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if (interator.organization && indexPath.section == 0) {
            router.showNewEvent()
        } else {
            guard let event = interator.getEvent(at: indexPath.section) else { return }
            router.showEventInfoScreen(for: event)
        }
    }
}

