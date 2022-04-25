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
        profile = Mocks.sashaProfile
    }

    func updateProfile(_ profile: Profile) {
        self.profile = profile
    }
}
