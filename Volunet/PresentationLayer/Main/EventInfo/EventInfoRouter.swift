//
//  EventInfoScreenRouter.swift
//  Volunet
//
//  Created by Софья Тимохина on 12.11.2021.
//

import Foundation

protocol IEventInfoScreenRouter {
    var viewController: IEventInfoScreenVC? { get set }

    func close()
    func onTapRespond()
}

final class EventInfoScreenRouter: IEventInfoScreenRouter {
    weak var viewController: IEventInfoScreenVC?

    func close() {
        viewController?.dismiss(animated: true)
    }

    func onTapRespond() {
        viewController?.dismiss(animated: true)
    }
}
