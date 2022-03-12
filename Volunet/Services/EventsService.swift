//
//  EventsService.swift
//  Volunet
//
//  Created by Софья Тимохина on 12.03.2022.
//

import Foundation

protocol IEventsService {
    func loadEvents(uuid: String, completion: @escaping (Result<[Event], Error>) -> Void)
}

class EventsService: IEventsService {
    private static var _shared: IEventsService?

    let queue = DispatchQueue(label: "EventsService", attributes: [.concurrent])

    static var shared: IEventsService {
        guard let instance = EventsService._shared else {
            EventsService._shared = EventsService()
            return EventsService._shared!
        }
        return instance
    }

    func loadEvents(uuid: String, completion: @escaping (Result<[Event], Error>) -> Void) {
        // TODO: load events
        queue.async { [weak self] in
            DispatchQueue.main.async {
                completion(.success([]))
            }
        }
    }
}
