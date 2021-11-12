//
//  MainScreenRouter.swift
//  Volunet
//
//  Created by Софья Тимохина on 12.11.2021.
//

import Foundation

protocol IMainScreenRouter {
    var viewController: IMainScreenVC? { get set }
}

final class MainScreenRouter: IMainScreenRouter {
    weak var viewController: IMainScreenVC?
}
