//
//  ProfileScreenGraph.swift
//  Volunet
//
//  Created by Софья Тимохина on 03.02.2022.
//

import UIKit

final class ProfileScreenGraph {
    private let view: IProfileScreenVC
    private var presenter: IProfileScreenPresenter
    private let interator: IProfileScreenInterator
    private var router: IProfileScreenRouter

    var viewController: UIViewController {
        view
    }

    init() {
        presenter = ProfileScreenPresenter()
        interator = ProfileScreenInterator(presenter: presenter, profileStorage: ProfileStorage.shared)
        router = ProfileScreenRouter()
        view = ProfileScreenVC(interator: interator, router: router)
        router.viewController = view
        presenter.viewController = view
    }
}
