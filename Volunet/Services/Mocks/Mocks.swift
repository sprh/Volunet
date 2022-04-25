//
//  Mocks.swift
//  Volunet
//
//  Created by Софья Тимохина on 25.04.2022.
//

import Foundation

class Mocks {
    public static let sashaProfile = Profile(uuid: 1,
                                             name: "Саша",
                                             events: [UserEvent(event:
                                                                    Event(startDate: "05/07/21", title: "Юбилей ВДНХ", description: "2", ownerName: "23", location: "ВДНХ", ownerUuid: 1), mark: 4.9, comment: "Comment"),],
                                             specialHealthFeatures: [],
                                             imageUrl: "image",
                                             avards: [Avard(title: "Шарики - детям", image: .balloon)],
                                             accountType: .organization)

    public static let vasyaProfile = Profile(uuid: 2,
                                             name: "Вася",
                                             events: [UserEvent(event:
                                                                    Event(startDate: "05/07/21", title: "Юбилей ВДНХ", description: "2", ownerName: "23", location: "ВДНХ", ownerUuid: 1), mark: 4.9, comment: "Comment"),],
                                             specialHealthFeatures: ["Плохой слух"],
                                             imageUrl: "image",
                                             avards: [Avard(title: "Шарики - детям", image: .volunteerOrganizationPlaceholder)],
                                             accountType: .organization)

    public static let events = [Event(startDate: "05/21",
                                      title: "Мы едем в приют!",
                                      description: "Ты сможешь поделиться своей любовью и заботой с собаками из приюта ‘В добрые руки’. Если хочешь, захвати с собой немного корма, всех ждем :)",
                                      ownerName: "Мосволонтер",
                                      location: "Приют", ownerUuid: 1),
                                Event(startDate: "05/21",
                                                                  title: "День рождения ВДНХ",
                                                                  description: "Наш всеми любимый ВДНХ отмечает годовщину. Кто как ни волонтеры могут сделать этот праздник лучшим?",
                                                                  ownerName: "Твори добро",
                                      location: "ВДНХ", ownerUuid: 1),
                                Event(startDate: "04/21",
                                                                  title: "День донора",
                                                                  description: "Ты сможешь поделиться своей любовью и заботой с собаками из приюта N. Если хочешь, захвати с собой немного корма, всех ждем :)",
                                                                  ownerName: "Твори добро",
                                      location: "Больница", ownerUuid: 1)]
}
