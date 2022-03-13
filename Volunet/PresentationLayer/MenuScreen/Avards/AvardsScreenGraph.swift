//
//  AvardsScreenGraph.swift
//  Volunet
//
//  Created by Софья Тимохина on 14.02.2022.
//

import UIKit

final class AvardsScreenGraph {
    private let view: IAvardsScreenVC
    private var presenter: IAvardsScreenPresenter
    private let interator: IAvardsScreenInterator
    private var router: IAvardsScreenRouter

    var viewController: UIViewController {
        view
    }

    init() {
        presenter = AvardsScreenPresenter()
        interator = AvardsScreenInterator(presenter: presenter)
        router = AvardsScreenRouter()
        view = AvardsScreenVC(interator: interator, router: router)
        router.viewController = view
        presenter.viewController = view
    }
}
