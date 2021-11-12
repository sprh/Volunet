//
//  WelcomingScreenRouter.swift
//  Volunet
//
//  Created by Софья Тимохина on 06.11.2021.
//

import UIKit

protocol IWelcomingScreenRouter: AnyObject {
    var viewController: UIViewController? { get set }

    func openSignInPage()
    func openRegistrationPage()
}

final class WelcomingScreenRouter: IWelcomingScreenRouter {
    weak var viewController: UIViewController?

    func openSignInPage() {
        let graph = SignInScreenGraph()
        viewController?.navigationController?.pushViewController(graph.viewController, animated: true)
    }

    func openRegistrationPage() {
        let graph = RegistrationScreenGraph()
        viewController?.navigationController?.pushViewController(graph.viewController, animated: true)
    }
}
