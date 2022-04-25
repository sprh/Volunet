//
//  ChatsListVC.swift
//  Volunet
//
//  Created by Софья Тимохина on 25.04.2022.
//

import Foundation
import UIKit

class ChatsListVC: UIViewController {
    let chatsListView: ChatsListView = {
        let view = ChatsListView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }

    private func setup() {
        view.backgroundColor = .background
        view.addSubview(chatsListView)

        NSLayoutConstraint.activate([
            chatsListView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            chatsListView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            chatsListView.topAnchor.constraint(equalTo: view.topAnchor),
            chatsListView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 100),
        ])
        chatsListView.frame.size.width = view.frame.width
        chatsListView.setup()
        chatsListView.chatsList.delegate = self
        chatsListView.chatsList.dataSource = self
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        chatsListView.chatsList.reloadData()
    }
}

extension ChatsListVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "\(ChatCell.self)") as? ChatCell else {
            return UITableViewCell()
        }
        cell.setup()
        cell.layoutIfNeeded()
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let view = ChatVC()
        navigationController?.pushViewController(view, animated: true)
    }
}
