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

    init(interator: IRegistrationScreenInterator,
         router: IRegistrationScreenRouter) {
        self.interator = interator
        self.router = router
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

