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
    func showErrorDialog(error: String)
    func showNewEvent()
}

final class EventsListScreenRouter: IEventsListScreenRouter {
    weak var viewController: IEventsListScreenVC?

    func showEventInfoScreen(for event: Event) {
        let graph = EventInfoScreenGraph(event: event)
        let navigationController = UINavigationController(rootViewController: graph.viewController)
        navigationController.modalPresentationStyle = .overCurrentContext
        viewController?.navigationController?.present(navigationController, animated: false)
    }

    func showErrorDialog(error: String) {
        let alert = UIAlertController(title: .getLocalizedString(for: .error), message: error, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: .getLocalizedString(for: .ok), style: UIAlertAction.Style.default, handler: nil))
        viewController?.present(alert, animated: true, completion: nil)
    }

    func showNewEvent() {
        let graph = NewEventScreenGraph()
        let navigationController = UINavigationController(rootViewController: graph.viewController)
        navigationController.modalPresentationStyle = .overCurrentContext
        viewController?.navigationController?.present(navigationController, animated: false)
    }
}
