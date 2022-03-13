//
//  MenuScreenGraph.swift
//  Volunet
//
//  Created by Софья Тимохина on 13.03.2022.
//

import UIKit

final class MenuScreenGraph {
    private let view: IMenuScreenVC
    private var presenter: IMenuScreenPresenter
    private let interator: IMenuScreenInterator
    private var router: IMenuScreenRouter

    var viewController: UIViewController {
        view
    }

    init() {
        presenter = MenuScreenPresenter()
        interator = MenuScreenInterator(presenter: presenter, profileStorage: ProfileStorage.shared)
        router = MenuScreenRouter()
        view = MenuScreenVC(interator: interator, router: router)
        router.viewController = view
        presenter.viewController = view
    }
}
