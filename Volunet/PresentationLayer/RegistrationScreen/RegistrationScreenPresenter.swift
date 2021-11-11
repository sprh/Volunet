//
//  RegistrationScreenPresenter.swift
//  Volunet
//
//  Created by Софья Тимохина on 11.11.2021.
//

import Foundation

protocol IRegistrationScreenPresenter {
    var viewController: IRegistrationScreenVC? { get set }
}

final class RegistrationScreenPresenter: IRegistrationScreenPresenter {
    weak var viewController: IRegistrationScreenVC?
}
