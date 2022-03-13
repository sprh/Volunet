//
//  EventsListScreenPresenter.swift
//  Volunet
//
//  Created by Софья Тимохина on 12.11.2021.
//

import Foundation

protocol IEventsListScreenPresenter {
    var viewController: IEventsListScreenVC? { get set }

    func onLoadingError(error: String)
    func onLoadEvents()
}

final class EventsListScreenPresenter: IEventsListScreenPresenter {
    weak var viewController: IEventsListScreenVC?

    func onLoadingError(error: String) {
        viewController?.onLoadingError(error: error)
    }

    func onLoadEvents() {
        viewController?.onLoadEvents()
    }
}
