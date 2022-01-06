//
//  SignInScreenRouter.swift
//  Volunet
//
//  Created by Софья Тимохина on 11.11.2021.
//

import Foundation

protocol ISignInScreenRouter {
    var viewController: ISignInScreenVC? { get set }
}

final class SignInScreenRouter: ISignInScreenRouter {
    weak var viewController: ISignInScreenVC?
}
