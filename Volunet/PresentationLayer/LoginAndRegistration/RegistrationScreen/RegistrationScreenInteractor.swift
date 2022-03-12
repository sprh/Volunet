//
//  RegistrationScreenInteractor.swift
//  Volunet
//
//  Created by Софья Тимохина on 11.11.2021.
//

import Foundation

protocol IRegistrationScreenInterator {
    func onTapRegister(email: String, password: String, name: String, accountType: Int)
}

final class RegistrationScreenInterator: IRegistrationScreenInterator {
    private let presenter: IRegistrationScreenPresenter
    private let registrationServive: IRegistrationService
    private let profileStorage: IProfileStorage

    init(presenter: IRegistrationScreenPresenter, registrationService: IRegistrationService, profileStorage: IProfileStorage) {
        self.presenter = presenter
        self.registrationServive = registrationService
        self.profileStorage = profileStorage
    }

    func onTapRegister(email: String, password: String, name: String, accountType: Int) {
        registrationServive.register(name: name,
                                     accountType: AccountType.init(rawValue: accountType) ?? AccountType.volunteer,
                                     email: email,
                                     password: password) { [weak self] result in
            switch result {
            case let .success(profile):
                guard let profile = profile else {
                    self?.presenter.onRegistrationError(error: .getLocalizedString(for: .somethingWentWrong))
                    return
                }
                self?.profileStorage.updateProfile(profile)
                self?.presenter.onRegistrationSuccess()
            case let .failure(error):
                self?.presenter.onRegistrationError(error: error.localizedDescription)
            }
        }
    }
}
