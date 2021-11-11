//
//  SignInScreenPresenter.swift
//  Volunet
//
//  Created by Софья Тимохина on 11.11.2021.
//

import Foundation

protocol ISignInScreenPresenter {
    var viewController: ISignInScreenVC? { get set }
}

final class SignInScreenPresenter: ISignInScreenPresenter {
    weak var viewController: ISignInScreenVC?
}
