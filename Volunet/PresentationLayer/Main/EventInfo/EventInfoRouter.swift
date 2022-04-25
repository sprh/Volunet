//
//  EventInfoScreenRouter.swift
//  Volunet
//
//  Created by Софья Тимохина on 12.11.2021.
//

import UIKit

protocol IEventInfoScreenRouter {
    var viewController: IEventInfoScreenVC? { get set }

    func close()
    func onTapRespond()
    func onTapImage()
}

final class EventInfoScreenRouter: IEventInfoScreenRouter {
    weak var viewController: IEventInfoScreenVC?

    func close() {
        viewController?.dismiss(animated: true)
    }

    func onTapRespond() {
        viewController?.dismiss(animated: true)
    }

    func onTapImage() {
        let navigationController = UINavigationController(rootViewController: AnotherProfileVC())
        navigationController.modalPresentationStyle = .overCurrentContext
        viewController?.navigationController?.present(navigationController, animated: false)
    }
}
