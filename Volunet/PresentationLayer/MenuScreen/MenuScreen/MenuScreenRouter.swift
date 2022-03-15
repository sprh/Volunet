//
//  MenuScreenRouter.swift
//  Volunet
//
//  Created by Софья Тимохина on 13.03.2022.
//

import Foundation

protocol IMenuScreenRouter {
    var viewController: IMenuScreenVC? { get set }

    func onTapProfile()
    func onTapAvards()
    func onTapAboutApp()
}

final class MenuScreenRouter: IMenuScreenRouter {
    weak var viewController: IMenuScreenVC?

    func onTapProfile() {
        viewController?.navigationController?.pushViewController(ProfileScreenGraph().viewController, animated: true)
    }

    func onTapAvards() {
        viewController?.navigationController?.pushViewController(AvardsScreenGraph().viewController, animated: true)
    }

    func onTapAboutApp() {
        // TODO: 
//        viewController?.navigationController?.pushViewController(ProfileScreenGraph().viewController, animated: true)
    }
}
