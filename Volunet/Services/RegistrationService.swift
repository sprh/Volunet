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
                                events: [UserEvent(event: Event(startDate: "05/07/21", title: "Юбилей ВДНХ", description: "2", ownerName: "23", location: "ВДНХ"), mark: 4.9, comment: "Comment"),
                                         UserEvent(event: Event(startDate: "05/07/21", title: "Поездка в детский дом", description: "2", ownerName: "23", location: "ВДНХ"), mark: 5.0, comment: "Comment")],
                                specialHealthFeatures: ["Вегетарианец", "Плохой слух"],
                                imageUrl: "image",
                                avards: [Avard(title: "Шарики - детям", image: .volunteerOrganizationPlaceholder)])

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
