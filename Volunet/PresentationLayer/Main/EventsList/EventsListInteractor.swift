//
//  EventsListScreenInteractor.swift
//  Volunet
//
//  Created by Софья Тимохина on 12.11.2021.
//

import Foundation

protocol IEventsListScreenInterator {
    var eventsCount: Int { get }

    var loading: Bool { get set }

    var organization: Bool { get }

    func getEvent(at index: Int) -> Event?
    func loadEvents()
}

final class EventsListScreenInterator: IEventsListScreenInterator {
    private let presenter: IEventsListScreenPresenter
    private let eventsStorage: IEventsStorage
    private let eventsService: IEventsService
    private let profileStorage: IProfileStorage

    var eventsCount: Int {
        eventsStorage.eventsCount
    }

    var profile: Profile {
        profileStorage.profile!
    }

    var loading = true

    var organization: Bool {
        return profileStorage.profile?.accountType == .organization
    }

    init(presenter: IEventsListScreenPresenter,
         eventsStorage: IEventsStorage,
         eventsService: IEventsService,
         profileStorage: IProfileStorage) {
        self.presenter = presenter
        self.eventsStorage = eventsStorage
        self.eventsService = eventsService
        self.profileStorage = profileStorage
    }

    func getEvent(at index: Int) -> Event? {
        return eventsStorage.getEvent(at: index)
    }

    func loadEvents() {
        loading = true
        eventsService.loadEvents(uuid: profile.uuid) { [weak self] result in
            self?.loading = false
            switch result {
            case let .success(events):
                self?.eventsStorage.addEvents(events: events)
                self?.presenter.onLoadEvents()
            case let .failure(error):
                self?.presenter.onLoadingError(error: error.localizedDescription)
            }
        }
    }
}
