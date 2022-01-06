//
//  SignInScreenGraph.swift
//  Volunet
//
//  Created by Софья Тимохина on 11.11.2021.
//

import UIKit

final class SignInScreenGraph {
    private let view: ISignInScreenVC
    private var presenter: ISignInScreenPresenter
    private let interator: ISignInScreenInterator
    private var router: ISignInScreenRouter

    var viewController: UIViewController {
        view
    }

    init() {
        presenter = SignInScreenPresenter()
        interator = SignInScreenInterator(presenter: presenter)
        router = SignInScreenRouter()
        view = SignInScreenVC(interator: interator, router: router)
        router.viewController = view
        presenter.viewController = view
    }
}
