//
//  SignInScreenInteractor.swift
//  Volunet
//
//  Created by Софья Тимохина on 11.11.2021.
//

import Foundation

protocol ISignInScreenInterator {
    func onTapSignIn(email: String, password: String)
}

final class SignInScreenInterator: ISignInScreenInterator {
    private let presenter: ISignInScreenPresenter
    private let signInSevice: ISignInService
    private let profileStorage: IProfileStorage

    init(presenter: ISignInScreenPresenter,
         signInSevice: ISignInService,
         profileStorage: IProfileStorage) {
        self.presenter = presenter
        self.signInSevice = signInSevice
        self.profileStorage = profileStorage
    }

    func onTapSignIn(email: String, password: String) {
        signInSevice.signIn(email: email, password: password) { [weak self] result in
            switch result {
            case let .success(profile):
                guard let profile = profile else {
                    self?.presenter.onSignInError(error: "Что-то пошло не так")
                    return
                }
                self?.profileStorage.updateProfile(profile)
                self?.presenter.onSignInSuccess()
            case let .failure(error):
                self?.presenter.onSignInError(error: error.localizedDescription)
            }
        }
    }
}
