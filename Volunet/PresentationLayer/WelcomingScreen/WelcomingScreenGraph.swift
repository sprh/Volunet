//
//  WelcomingScreenGraph.swift
//  Volunet
//
//  Created by Софья Тимохина on 06.11.2021.
//

import UIKit

final class WelcomingScreenGraph {
    var viewController: UIViewController {
        view
    }

    private let view: WelcomingScreenVC
    private let router: IWelcomingScreenRouter

    init() {
        router = WelcomingScreenRouter()
        view = WelcomingScreenVC(router: router)
        router.viewController = view
    }
}
