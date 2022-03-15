//
//  EventInfoScreenInteractor.swift
//  Volunet
//
//  Created by Софья Тимохина on 12.11.2021.
//

import Foundation

protocol IEventInfoScreenInterator {
    var eventTitle: String { get }
    var eventDescription: String { get }
    var eventOwner: String { get }
    var eventLocation: String { get }
    var eventDate: String { get }
}

final class EventInfoScreenInterator: IEventInfoScreenInterator {
    private let presenter: IEventInfoScreenPresenter
    private let event: Event

    var eventTitle: String {
        event.title
    }

    var eventDescription: String {
        event.description
    }

    var eventOwner: String {
        event.ownerName
    }

    var eventLocation: String {
        event.location
    }

    var eventDate: String {
        event.startDate
    }

    init(presenter: IEventInfoScreenPresenter, event: Event) {
        self.presenter = presenter
        self.event = event
    }
}
