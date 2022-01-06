//
//  SignInScreenInteractor.swift
//  Volunet
//
//  Created by Софья Тимохина on 11.11.2021.
//

import Foundation

protocol ISignInScreenInterator {

}

final class SignInScreenInterator: ISignInScreenInterator {
    private let presenter: ISignInScreenPresenter

    init(presenter: ISignInScreenPresenter) {
        self.presenter = presenter
    }
}
