//
//  ProfileStorage.swift
//  Volunet
//
//  Created by Софья Тимохина on 03.02.2022.
//

import Foundation

protocol IProfileStorage: AnyObject {
    var profile: Profile? { get set }

    func updateProfile(_ profile: Profile)
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
        // TODO: remove
        profile = Profile(uuid: "1",
                                                  name: "Саша",
                          events: [UserEvent(event: Event(startDate: "05/07/21", title: "Юбилей ВДНХ", description: "2", ownerName: "23", location: "ВДНХ"), mark: 4.9, comment: "Comment"),
                                   UserEvent(event: Event(startDate: "05/07/21", title: "Поездка в детский дом", description: "2", ownerName: "23", location: "ВДНХ"), mark: 5.0, comment: "Comment")],
                                                  specialHealthFeatures: ["Вегетарианец", "Плохой слух"],
                                                  imageUrl: "image",
                          avards: [Avard(title: "Шарики - детям", image: .volunteerOrganizationPlaceholder)], accountType: .organization)
    }

    func updateProfile(_ profile: Profile) {
        self.profile = profile
    }
}
