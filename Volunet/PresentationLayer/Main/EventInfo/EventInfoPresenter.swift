//
//  EventInfoScreenPresenter.swift
//  Volunet
//
//  Created by Софья Тимохина on 12.11.2021.
//

import Foundation

protocol IEventInfoScreenPresenter {
    var viewController: IEventInfoScreenVC? { get set }
}

final class EventInfoScreenPresenter: IEventInfoScreenPresenter {
    weak var viewController: IEventInfoScreenVC?
}
