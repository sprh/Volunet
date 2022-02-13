//
//  ProfileScreenRouter.swift
//  Volunet
//
//  Created by Софья Тимохина on 03.02.2022.
//

import Foundation

protocol IProfileScreenRouter {
    var viewController: IProfileScreenVC? { get set }

    func goBack()
    func onTapLogout()
}

final class ProfileScreenRouter: IProfileScreenRouter {
    weak var viewController: IProfileScreenVC?

    func goBack() {
        viewController?.navigationController?.popViewController(animated: true)
    }

    func onTapLogout() {
        let graph = WelcomingScreenGraph()
        viewController?.navigationController?.pushViewController(graph.viewController, animated: true)
    }
}
