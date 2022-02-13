//
//  EventsService.swift
//  Volunet
//
//  Created by Софья Тимохина on 06.01.2022.
//

import Foundation
import UIKit

protocol IEventsStorage: AnyObject {
    func getEvent(at index: Int) -> Event?

    var eventsCount: Int { get }
}

final class EventsStorage: IEventsStorage {
    private var events: [Event]

    private static var _shared: IEventsStorage?

    static var shared: IEventsStorage {
        guard let instance = EventsStorage._shared else {
            EventsStorage._shared = EventsStorage()
            return EventsStorage._shared!
        }
        return instance
    }

    var eventsCount: Int {
        events.count
    }

    private init() {
        events = []
    }

    func getEvent(at index: Int) -> Event? {
        return index >= events.count ? nil : events[index]
    }
}
