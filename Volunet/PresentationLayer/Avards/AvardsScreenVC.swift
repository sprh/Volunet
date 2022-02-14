//
//  AvardsScreenVC.swift
//  Volunet
//
//  Created by Софья Тимохина on 14.02.2022.
//

import UIKit

protocol IAvardsScreenVC: UIViewController {

}

final class AvardsScreenVC: UIViewController, IAvardsScreenVC {
    private let interator: IAvardsScreenInterator
    private let router: IAvardsScreenRouter

    lazy var avardsScreenView: AvardsScreenView = {
        let view = AvardsScreenView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.avardsTable.delegate = self
        view.avardsTable.dataSource = self
        return view
    }()

    init(interator: IAvardsScreenInterator,
         router: IAvardsScreenRouter) {
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

    private func setup() {
        setNavigationControllerTransparent()
        hideKeyboardWhenTappedAround()

        view.backgroundColor = .background
        view.addSubview(avardsScreenView)
        NSLayoutConstraint.activate([
            avardsScreenView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            avardsScreenView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            avardsScreenView.topAnchor.constraint(equalTo: view.topAnchor),
            avardsScreenView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 100),
        ])
        avardsScreenView.frame = view.frame
        avardsScreenView.setup()
//        avardsScreenView.scrollView.setContentSize()
    }

    @objc
    func didTapCloseButton() {
        router.close()
    }
}

extension AvardsScreenVC: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 10
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "\(AvardCell.self)") as? AvardCell
                else { return UITableViewCell() }

//              let event = interator.getEvent(at: indexPath.section) else { return UITableViewCell() }
        cell.setup(avard: Avard(title: "title", image: .add))
        cell.isUserInteractionEnabled = false
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
}

