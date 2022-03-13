//
//  AvardsScreenRouter.swift
//  Volunet
//
//  Created by Софья Тимохина on 14.02.2022.
//

import Foundation

protocol IAvardsScreenRouter {
    var viewController: IAvardsScreenVC? { get set }

    func close()
}

final class AvardsScreenRouter: IAvardsScreenRouter {
    weak var viewController: IAvardsScreenVC?

    func close() {
        viewController?.navigationController?.popViewController(animated: true)
    }
}
