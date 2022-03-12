//
//  StartScreenGraph.swift
//  Volunet
//
//  Created by Софья Тимохина on 12.03.2022.
//

import UIKit

final class StartScreenGraph {
    var viewController: UIViewController {
        view
    }

    private let view: StartScreenVC
    private let router: IStartScreenRouter
    private let interactor: IStartScreenInteractor
    private var presenter: IStartScreenPresenter

    init() {
        router = StartScreenRouter()
        presenter = StartScreenPresenter()
        interactor = StartScreenInteractor(presenter: presenter,
                                           profileStorage: ProfileStorage.shared,
                                           signInService: SignInService.shared)
        view = StartScreenVC(router: router, interactor: interactor)
        router.viewController = view
        presenter.viewController = view
    }
}
