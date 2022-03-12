//
//  RegistrationScreenPresenter.swift
//  Volunet
//
//  Created by Софья Тимохина on 11.11.2021.
//

import Foundation

protocol IRegistrationScreenPresenter {
    var viewController: IRegistrationScreenVC? { get set }

    func onRegistrationError(error: String)
    func onRegistrationSuccess()
}

final class RegistrationScreenPresenter: IRegistrationScreenPresenter {
    weak var viewController: IRegistrationScreenVC?

    func onRegistrationError(error: String) {
        viewController?.showErrorDialog(error: error)
    }

    func onRegistrationSuccess() {
        viewController?.goToMainScreen()
    }
}
