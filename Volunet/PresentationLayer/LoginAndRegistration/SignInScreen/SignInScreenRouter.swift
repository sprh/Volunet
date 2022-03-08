//
//  SignInScreenRouter.swift
//  Volunet
//
//  Created by Софья Тимохина on 11.11.2021.
//

import Foundation

protocol ISignInScreenRouter {
    var viewController: ISignInScreenVC? { get set }

    func goBack()
}

final class SignInScreenRouter: ISignInScreenRouter {
    weak var viewController: ISignInScreenVC?

    func goBack() {
        viewController?.navigationController?.popViewController(animated: true)
    }
}
