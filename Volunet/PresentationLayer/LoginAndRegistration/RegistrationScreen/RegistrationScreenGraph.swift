//
//  RegistrationScreenGraph.swift
//  Volunet
//
//  Created by Софья Тимохина on 11.11.2021.
//

import UIKit

final class RegistrationScreenGraph {
    private let view: IRegistrationScreenVC
    private var presenter: IRegistrationScreenPresenter
    private let interator: IRegistrationScreenInterator
    private var router: IRegistrationScreenRouter

    var viewController: UIViewController {
        view
    }

    init() {
        presenter = RegistrationScreenPresenter()
        interator = RegistrationScreenInterator(presenter: presenter, registrationService: RegistrationService.shared, profileStorage: ProfileStorage.shared)
        router = RegistrationScreenRouter()
        view = RegistrationScreenVC(interator: interator, router: router)
        router.viewController = view
        presenter.viewController = view
    }
}
