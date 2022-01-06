//
//  EventInfoScreenGraph.swift
//  Volunet
//
//  Created by Софья Тимохина on 12.11.2021.
//

import UIKit

final class EventInfoScreenGraph {
    private let view: IEventInfoScreenVC
    private var presenter: IEventInfoScreenPresenter
    private let interator: IEventInfoScreenInterator
    private var router: IEventInfoScreenRouter

    var viewController: UIViewController {
        view
    }

    init(event: Event) {
        presenter = EventInfoScreenPresenter()
        interator = EventInfoScreenInterator(presenter: presenter, event: event)
        router = EventInfoScreenRouter()
        view = EventInfoScreenVC(interator: interator, router: router)
        router.viewController = view
        presenter.viewController = view
    }
}
