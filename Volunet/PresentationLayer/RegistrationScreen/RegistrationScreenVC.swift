//
//  RegistrationScreenVC.swift
//  Volunet
//
//  Created by Софья Тимохина on 11.11.2021.
//

import UIKit

protocol IRegistrationScreenVC: UIViewController {

}

final class RegistrationScreenVC: UIViewController, IRegistrationScreenVC {
    private let interator: IRegistrationScreenInterator
    private let router: IRegistrationScreenRouter

    let registrationScreenView: RegistrationScreenView = {
        let view = RegistrationScreenView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    let backButton: UIBarButtonItem = {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        let imageView = UIImageView(frame: CGRect(x: 10, y: 10, width: 20, height: 20))
        imageView.image = .chevronLeft.withTintColor(.lightTeal)
        button.addSubview(imageView)
        button.addSubview(imageView)
        button.addTarget(self, action: #selector(didTabBackButton), for: .touchUpInside)
        let leftBarButtonItem = UIBarButtonItem(customView: button)
        return leftBarButtonItem
    }()

    init(interator: IRegistrationScreenInterator,
         router: IRegistrationScreenRouter) {
        self.interator = interator
        self.router = router
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.setHidesBackButton(true, animated: false)
        navigationItem.leftBarButtonItem = backButton
        setNavigationControllerTransparent()
        hideKeyboardWhenTappedAround()
        
        view.backgroundColor = .background
        view.addSubview(registrationScreenView)
        NSLayoutConstraint.activate([
            registrationScreenView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            registrationScreenView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            registrationScreenView.topAnchor.constraint(equalTo: view.topAnchor),
            registrationScreenView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
        registrationScreenView.setup()
    }

    @objc func didTabBackButton() {
        router.goBack()
    }
}

