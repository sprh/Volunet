//
//  EventsListScreenInteractor.swift
//  Volunet
//
//  Created by Софья Тимохина on 12.11.2021.
//

import Foundation

protocol IEventsListScreenInterator {
    var eventsCount: Int { get }

    func getEvent(at index: Int) -> Event?
}

final class EventsListScreenInterator: IEventsListScreenInterator {
    private let presenter: IEventsListScreenPresenter
    private let eventsStorage: IEventsStorage

    var eventsCount: Int {
        eventsStorage.eventsCount
    }

    init(presenter: IEventsListScreenPresenter, eventsStorage: IEventsStorage) {
        self.presenter = presenter
        self.eventsStorage = eventsStorage
    }

    func getEvent(at index: Int) -> Event? {
        return eventsStorage.getEvent(at: index)
    }
}
