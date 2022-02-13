//
//  ProfileScreenPresenter.swift
//  Volunet
//
//  Created by Софья Тимохина on 03.02.2022.
//

import Foundation

protocol IProfileScreenPresenter {
    var viewController: IProfileScreenVC? { get set }
}

final class ProfileScreenPresenter: IProfileScreenPresenter {
    weak var viewController: IProfileScreenVC?
}
