//
//  MainScreenGraph.swift
//  Volunet
//
//  Created by Софья Тимохина on 12.11.2021.
//

import UIKit

final class MainScreenGraph {
    private let view: IMainScreenVC
    private var presenter: IMainScreenPresenter
    private let interator: IMainScreenInterator
    private var router: IMainScreenRouter

    var viewController: UIViewController {
        view
    }

    init() {
        presenter = MainScreenPresenter()
        interator = MainScreenInterator(presenter: presenter)
        router = MainScreenRouter()
        view = MainScreenVC(interator: interator, router: router)
        router.viewController = view
        presenter.viewController = view
    }
}
