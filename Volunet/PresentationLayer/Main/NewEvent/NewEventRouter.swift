//
//  NewEventScreenRouter.swift
//  Volunet
//
//  Created by Софья Тимохина on 12.11.2021.
//

import Foundation

protocol INewEventScreenRouter {
    var viewController: INewEventScreenVC? { get set }

    func close()
    func onTapRespond()
}

final class NewEventScreenRouter: INewEventScreenRouter {
    weak var viewController: INewEventScreenVC?

    func close() {
        viewController?.dismiss(animated: true)
    }

    func onTapRespond() {
        viewController?.dismiss(animated: true)
    }
}
