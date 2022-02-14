//
//  ProfileStorage.swift
//  Volunet
//
//  Created by Софья Тимохина on 03.02.2022.
//

import Foundation

protocol IProfileStorage: AnyObject {
    var profile: Profile? { get set }
}

final class ProfileStorage: IProfileStorage {
    var profile: Profile?

    private static var _shared: IProfileStorage?

    static var shared: IProfileStorage {
        guard let instance = ProfileStorage._shared else {
            ProfileStorage._shared = ProfileStorage()
            return ProfileStorage._shared!
        }
        return instance
    }

    private init() {
        profile = Profile(firstName: "Саша",
                          lastName: "Семенов",
                          events: [UserEvent(event: Event(startDate: "1", title: "1", description: "2", ownerName: "23"), mark: 12.2, comment: "Comment"),
                                   UserEvent(event: Event(startDate: "1", title: "1", description: "2", ownerName: "23"), mark: 12.2, comment: "Comment")],
                          specialHealthFeatures: ["test", "test"],
                          imageUrl: "image",
                          avards: [Avard(title: "Шарики - детям", image: .add)])
    }
}
