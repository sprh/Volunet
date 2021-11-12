//
//  MainScreenPresenter.swift
//  Volunet
//
//  Created by Софья Тимохина on 12.11.2021.
//

import Foundation

protocol IMainScreenPresenter {
    var viewController: IMainScreenVC? { get set }
}

final class MainScreenPresenter: IMainScreenPresenter {
    weak var viewController: IMainScreenVC?
}
