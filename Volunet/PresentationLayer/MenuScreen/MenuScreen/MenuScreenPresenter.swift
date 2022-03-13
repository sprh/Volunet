//
//  MenuScreenPresenter.swift
//  Volunet
//
//  Created by Софья Тимохина on 13.03.2022.
//

import Foundation

protocol IMenuScreenPresenter {
    var viewController: IMenuScreenVC? { get set }
}

final class MenuScreenPresenter: IMenuScreenPresenter {
    weak var viewController: IMenuScreenVC?
}
