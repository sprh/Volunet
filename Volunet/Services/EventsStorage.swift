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

    var eventsCount: Int {
        events.count
    }

    init() {
        events = [Event(startDate: "", title: "title", description: "description", ownerName: "Owner name")]
    }

    func getEvent(at index: Int) -> Event? {
        return index >= events.count ? nil : events[index]
    }
}