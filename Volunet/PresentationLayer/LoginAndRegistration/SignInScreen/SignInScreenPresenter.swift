//
//  SignInScreenPresenter.swift
//  Volunet
//
//  Created by Софья Тимохина on 11.11.2021.
//

import Foundation

protocol ISignInScreenPresenter {
    var viewController: ISignInScreenVC? { get set }

    func onSignInError(error: String)
    func onSignInSuccess()
}

final class SignInScreenPresenter: ISignInScreenPresenter {
    weak var viewController: ISignInScreenVC?

    func onSignInError(error: String) {
        viewController?.showErrorDialog(error: error)
    }

    func onSignInSuccess() {
        viewController?.goToMainScreen()
    }
}
