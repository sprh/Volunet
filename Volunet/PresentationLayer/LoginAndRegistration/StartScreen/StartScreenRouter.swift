//
//  StartScreenRouter.swift
//  Volunet
//
//  Created by Софья Тимохина on 12.03.2022.
//

import UIKit

protocol IStartScreenRouter: AnyObject {
    var viewController: UIViewController? { get set }

    func openMainPage()
    func openWelcomingScreen()
}

final class StartScreenRouter: IStartScreenRouter {
    weak var viewController: UIViewController?

    func openMainPage() {
        let graph = TabBarControllerGraph()
        viewController?.navigationController?.setViewControllers([graph.controller], animated: true)
    }

    func openWelcomingScreen() {
        let graph = WelcomingScreenGraph()
        viewController?.navigationController?.setViewControllers([graph.viewController], animated: true)
    }
}
