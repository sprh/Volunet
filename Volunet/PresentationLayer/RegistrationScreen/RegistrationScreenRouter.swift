//
//  RegistrationScreenRouter.swift
//  Volunet
//
//  Created by Софья Тимохина on 11.11.2021.
//

import Foundation

protocol IRegistrationScreenRouter {
    var viewController: IRegistrationScreenVC? { get set }

    func goBack()
}

final class RegistrationScreenRouter: IRegistrationScreenRouter {
    weak var viewController: IRegistrationScreenVC?

    func goBack() {
        viewController?.navigationController?.popViewController(animated: true)
    }
}
