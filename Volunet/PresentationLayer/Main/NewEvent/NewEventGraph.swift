//
//  NewEventScreenGraph.swift
//  Volunet
//
//  Created by Софья Тимохина on 19.04.2022.
//

import UIKit

final class NewEventScreenGraph {
    private let view: INewEventScreenVC
    private var presenter: INewEventScreenPresenter
    private let interator: INewEventScreenInterator
    private var router: INewEventScreenRouter

    var viewController: UIViewController {
        view
    }

    init() {
        presenter = NewEventScreenPresenter()
        interator = NewEventScreenInterator(presenter: presenter)
        router = NewEventScreenRouter()
        view = NewEventScreenVC(interator: interator, router: router)
        router.viewController = view
        presenter.viewController = view
    }
}
