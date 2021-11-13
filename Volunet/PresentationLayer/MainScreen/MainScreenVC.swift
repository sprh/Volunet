//
//  MainScreenVC.swift
//  Volunet
//
//  Created by Софья Тимохина on 12.11.2021.
//

import UIKit

protocol IMainScreenVC: UIViewController {

}

final class MainScreenVC: UIViewController, IMainScreenVC {
    private let interator: IMainScreenInterator
    private let router: IMainScreenRouter

    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: view.frame, style: .insetGrouped)
        tableView.backgroundColor = .clear
        tableView.register(EventCell.self, forCellReuseIdentifier: "\(EventCell.self)")
        tableView.delegate = self
        tableView.dataSource = self
        tableView.alwaysBounceVertical = true
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

    init(interator: IMainScreenInterator,
         router: IMainScreenRouter) {
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

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.navigationBar.isHidden = false
    }
}

extension MainScreenVC: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 10
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "\(EventCell.self)") as? EventCell else { return UITableViewCell() }
        cell.setup()
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
            label.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -26),
        ])
        return tableViewHeaderView
    }
}

