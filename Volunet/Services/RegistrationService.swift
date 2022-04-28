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
    static var shared: IRegistrationService {
        guard let instance = RegistrationService._shared else {
            RegistrationService._shared = RegistrationService()
            return RegistrationService._shared!
        }
        return instance
    }

    func register(name: String, accountType: AccountType, email: String, password: String, completion: @escaping (Result<Profile?, Error>) -> Void) {
        completion(.success(Mocks.sashaProfile))
    }
}
