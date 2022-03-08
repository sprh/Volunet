//
//  SignInScreenRouter.swift
//  Volunet
//
//  Created by Софья Тимохина on 11.11.2021.
//

import UIKit

protocol ISignInScreenRouter {
    var viewController: ISignInScreenVC? { get set }

    func goBack()
    func openMainScreen()
    func showErrorDialog(error: String)
}

final class SignInScreenRouter: ISignInScreenRouter {
    weak var viewController: ISignInScreenVC?

    func goBack() {
        viewController?.navigationController?.popViewController(animated: true)
    }

    func openMainScreen() {
        let graph = TabBarControllerGraph()
        viewController?.navigationController?.pushViewController(graph.controller, animated: true)
    }

    func showErrorDialog(error: String) {
        let alert = UIAlertController(title: .getLocalizedString(for: .error), message: error, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: .getLocalizedString(for: .ok), style: UIAlertAction.Style.default, handler: nil))
        viewController?.present(alert, animated: true, completion: nil)
    }
}
