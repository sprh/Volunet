//
//  RegistrationScreenRouter.swift
//  Volunet
//
//  Created by Софья Тимохина on 11.11.2021.
//

import UIKit

protocol IRegistrationScreenRouter {
    var viewController: IRegistrationScreenVC? { get set }

    func goBack()
    func openMainScreen()
    func showErrorDialog(error: String)
}

final class RegistrationScreenRouter: IRegistrationScreenRouter {
    weak var viewController: IRegistrationScreenVC?

    func goBack() {
        viewController?.navigationController?.popViewController(animated: true)
    }

    func openMainScreen() {
        let graph = TabBarControllerGraph()
        viewController?.navigationController?.setViewControllers([graph.controller], animated: true)
    }

    func showErrorDialog(error: String) {
        let alert = UIAlertController(title: .getLocalizedString(for: .error), message: error, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: .getLocalizedString(for: .ok), style: UIAlertAction.Style.default, handler: nil))
        viewController?.present(alert, animated: true, completion: nil)
    }
}
