//
//  EventsService.swift
//  Volunet
//
//  Created by Софья Тимохина on 12.03.2022.
//

import Foundation

protocol IEventsService {
    func loadEvents(uuid: Int, completion: @escaping (Result<[Event], Error>) -> Void)
    func register(id: Int, completion: @escaping (Result<Void, Error>) -> Void)
    func create(name: String, from: Date, to: Date, description: String, location: String, completion: @escaping (Result<Void, Error>) -> Void)
}

class EventsService: IEventsService {
    func register(id: Int, completion: @escaping (Result<Void, Error>) -> Void) {
    }

    func create(name: String, from: Date, to: Date, description: String, location: String, completion: @escaping (Result<Void, Error>) -> Void) {
    }

    private static var _shared: IEventsService?

    let queue = DispatchQueue(label: "EventsService", attributes: [.concurrent])

    static var shared: IEventsService {
        guard let instance = EventsService._shared else {
            EventsService._shared = EventsService()
            return EventsService._shared!
        }
        return instance
    }

    func loadEvents(uuid: Int, completion: @escaping (Result<[Event], Error>) -> Void) {
        queue.async { [weak self] in
            sleep(2)
            DispatchQueue.main.async {
                guard let self = self else {return}
                completion(.success(Mocks.events))
            }
        }
    }
}
