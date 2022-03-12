//
//  StartScreenPresenter.swift
//  Volunet
//
//  Created by Софья Тимохина on 12.03.2022.
//

import Foundation

protocol IStartScreenPresenter {
    var viewController: IStartScreenVC? { get set }

    func openWelcomingScreen()
    func openMainPage()
}

final class StartScreenPresenter: IStartScreenPresenter {
    weak var viewController: IStartScreenVC?

    func openMainPage() {
        viewController?.openMainPage()
    }

    func openWelcomingScreen() {
        viewController?.openWelcomingScreen()
    }
}
