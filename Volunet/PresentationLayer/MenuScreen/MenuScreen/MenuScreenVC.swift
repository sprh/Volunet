//
//  MenuScreenVC.swift
//  Volunet
//
//  Created by Софья Тимохина on 13.03.2022.
//

import UIKit

protocol IMenuScreenVC: UIViewController {

}

final class MenuScreenVC: UIViewController, IMenuScreenVC {
    private let interator: IMenuScreenInterator
    private let router: IMenuScreenRouter

    lazy var menuScreenView: MenuScreenView = {
        let view = MenuScreenView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    init(interator: IMenuScreenInterator,
         router: IMenuScreenRouter) {
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
        view.addSubview(menuScreenView)
        NSLayoutConstraint.activate([
            menuScreenView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            menuScreenView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            menuScreenView.topAnchor.constraint(equalTo: view.topAnchor),
            menuScreenView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 100),
        ])
        menuScreenView.frame = view.frame
        menuScreenView.setup()
//        menuScreenView.scrollView.setContentSize()
    }

    @objc
    func didTapCloseButton() {
        router.close()
    }
}

