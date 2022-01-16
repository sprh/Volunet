//
//  EventsListScreenRouter.swift
//  Volunet
//
//  Created by Софья Тимохина on 12.11.2021.
//

import Foundation
import UIKit

protocol IEventsListScreenRouter {
    var viewController: IEventsListScreenVC? { get set }

    func showEventInfoScreen(for event: Event)
}

final class EventsListScreenRouter: IEventsListScreenRouter {
    weak var viewController: IEventsListScreenVC?

    func showEventInfoScreen(for event: Event) {
        let graph = EventInfoScreenGraph(event: event)
        let navigationController = UINavigationController(rootViewController: graph.viewController)
        navigationController.modalPresentationStyle = .overCurrentContext
        viewController?.navigationController?.present(navigationController, animated: false)
    }
}
