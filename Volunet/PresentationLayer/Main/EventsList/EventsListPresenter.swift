//
//  EventsListScreenPresenter.swift
//  Volunet
//
//  Created by Софья Тимохина on 12.11.2021.
//

import Foundation

protocol IEventsListScreenPresenter {
    var viewController: IEventsListScreenVC? { get set }
}

final class EventsListScreenPresenter: IEventsListScreenPresenter {
    weak var viewController: IEventsListScreenVC?
}
