//
//  NewEventScreenPresenter.swift
//  Volunet
//
//  Created by Софья Тимохина on 19.04.2022.
//

import Foundation

protocol INewEventScreenPresenter {
    var viewController: INewEventScreenVC? { get set }
}

final class NewEventScreenPresenter: INewEventScreenPresenter {
    weak var viewController: INewEventScreenVC?
}
