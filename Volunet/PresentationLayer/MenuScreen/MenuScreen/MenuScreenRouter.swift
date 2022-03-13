//
//  MenuScreenRouter.swift
//  Volunet
//
//  Created by Софья Тимохина on 13.03.2022.
//

import Foundation

protocol IMenuScreenRouter {
    var viewController: IMenuScreenVC? { get set }

    func close()
}

final class MenuScreenRouter: IMenuScreenRouter {
    weak var viewController: IMenuScreenVC?

    func close() {
        viewController?.navigationController?.popViewController(animated: true)
    }
}
