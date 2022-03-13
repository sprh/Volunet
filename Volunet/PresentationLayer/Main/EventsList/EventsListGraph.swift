//
//  EventsListScreenGraph.swift
//  Volunet
//
//  Created by Софья Тимохина on 12.11.2021.
//

import UIKit

final class EventsListScreenGraph {
    private let view: IEventsListScreenVC
    private var presenter: IEventsListScreenPresenter
    private let interator: IEventsListScreenInterator
    private var router: IEventsListScreenRouter

    var viewController: UIViewController {
        view
    }

    init() {
        presenter = EventsListScreenPresenter()
        interator = EventsListScreenInterator(presenter: presenter,
                                              eventsStorage: EventsStorage.shared,
                                              eventsService: EventsService.shared,
                                              profileStorage: ProfileStorage.shared)
        router = EventsListScreenRouter()
        view = EventsListScreenVC(interator: interator, router: router)
        router.viewController = view
        presenter.viewController = view
    }
}
