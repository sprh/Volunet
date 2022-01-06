//
//  EventsListScreenRouter.swift
//  Volunet
//
//  Created by Софья Тимохина on 12.11.2021.
//

import Foundation

protocol IEventsListScreenRouter {
    var viewController: IEventsListScreenVC? { get set }
}

final class EventsListScreenRouter: IEventsListScreenRouter {
    weak var viewController: IEventsListScreenVC?
}
