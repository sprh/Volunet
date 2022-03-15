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

    private let mockedEvents = [Event(startDate: "05/21",
                                      title: "Мы едем в приют!",
                                      description: "Ты сможешь поделиться своей любовью и заботой с собаками из приюта ‘В добрые руки’. Если хочешь, захвати с собой немного корма, всех ждем :)",
                                      ownerName: "Мосволонтер",
                                      location: "Приют"),
                                Event(startDate: "05/21",
                                                                  title: "День рождения ВДНХ",
                                                                  description: "Наш всеми любимый ВДНХ отмечает годовщину. Кто как ни волонтеры могут сделать этот праздник лучшим?",
                                                                  ownerName: "Твори добро",
                                      location: "ВДНХ"),
                                Event(startDate: "04/21",
                                                                  title: "День донора",
                                                                  description: "Ты сможешь поделиться своей любовью и заботой с собаками из приюта N. Если хочешь, захвати с собой немного корма, всех ждем :)",
                                                                  ownerName: "Твори добро",
                                      location: "Больница")]

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
            sleep(2)
            DispatchQueue.main.async {
                guard let self = self else {return}
                completion(.success(self.mockedEvents))
            }
        }
    }
}
