//
//  RegistrationService.swift
//  Volunet
//
//  Created by Софья Тимохина on 08.03.2022.
//

import Foundation

protocol IRegistrationService {
    func register(name: String, accountType: AccountType, email: String, password: String, completion: @escaping (Result<Profile?, Error>) -> Void)
}

final class RegistrationService: IRegistrationService {
    private static var _shared: IRegistrationService?

    let queue = DispatchQueue(label: "RegistrationService")

    let mockedProfile = Profile(uuid: "1",
                                name: "Саша",
                                events: [UserEvent(event: Event(startDate: "1", title: "1", description: "2", ownerName: "23"), mark: 12.2, comment: "Comment"),
                                         UserEvent(event: Event(startDate: "1", title: "1", description: "2", ownerName: "23"), mark: 12.2, comment: "Comment")],
                                specialHealthFeatures: ["test", "test"],
                                imageUrl: "image",
                                avards: [Avard(title: "Шарики - детям", image: .add)])

    static var shared: IRegistrationService {
        guard let instance = RegistrationService._shared else {
            RegistrationService._shared = RegistrationService()
            return RegistrationService._shared!
        }
        return instance
    }

    func register(name: String, accountType: AccountType, email: String, password: String, completion: @escaping (Result<Profile?, Error>) -> Void) {
        // TODO: register
        completion(.success(mockedProfile))
    }
}
