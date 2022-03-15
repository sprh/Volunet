//
//  StartScreenInteractor.swift
//  Volunet
//
//  Created by Софья Тимохина on 12.03.2022.
//

import Foundation

protocol IStartScreenInteractor {
    func tryToSignIn()
}

class StartScreenInteractor: IStartScreenInteractor {
    let presenter: IStartScreenPresenter
    let profileStorage: IProfileStorage
    let signInService: ISignInService

    init(presenter: IStartScreenPresenter, profileStorage: IProfileStorage, signInService: ISignInService) {
        self.presenter = presenter
        self.profileStorage = profileStorage
        self.signInService = signInService
    }

    func tryToSignIn() {
        signInService.signIn(email: "", password: "") { [weak self] result in
            self?.presenter.openWelcomingScreen()
//            switch result {
//            case let .success(profile):
//                guard let profile = profile else {
//                    self?.presenter.openWelcomingScreen()
//                    return
//                }
//                self?.profileStorage.updateProfile(profile)
//                self?.presenter.openMainPage()
//            case .failure:
//                self?.presenter.openWelcomingScreen()
//            }
        }
    }
}
