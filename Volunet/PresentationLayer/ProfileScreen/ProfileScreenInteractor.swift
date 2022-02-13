//
//  ProfileScreenInteractor.swift
//  Volunet
//
//  Created by Софья Тимохина on 03.02.2022.
//

import Foundation

protocol IProfileScreenInterator {
    var profile: Profile { get }
    var eventsCount: Int { get }

    func getEvent(at index: Int) -> UserEvent?
}

final class ProfileScreenInterator: IProfileScreenInterator {
    private let presenter: IProfileScreenPresenter
    private let profileStorage: IProfileStorage

    var profile: Profile {
        profileStorage.profile!
    }

    var eventsCount: Int {
        profile.events.count
    }

    init(presenter: IProfileScreenPresenter, profileStorage: IProfileStorage) {
        self.presenter = presenter
        self.profileStorage = profileStorage
    }

    func getEvent(at index: Int) -> UserEvent? {
        return eventsCount < index ? nil : profile.events[index]
    }
}
