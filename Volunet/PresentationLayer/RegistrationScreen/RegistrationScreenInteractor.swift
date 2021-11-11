//
//  RegistrationScreenInteractor.swift
//  Volunet
//
//  Created by Софья Тимохина on 11.11.2021.
//

import Foundation

protocol IRegistrationScreenInterator {

}

final class RegistrationScreenInterator: IRegistrationScreenInterator {
    private let presenter: IRegistrationScreenPresenter

    init(presenter: IRegistrationScreenPresenter) {
        self.presenter = presenter
    }
}
