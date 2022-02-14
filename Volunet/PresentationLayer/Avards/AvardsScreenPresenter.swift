//
//  AvardsScreenPresenter.swift
//  Volunet
//
//  Created by Софья Тимохина on 14.02.2022.
//

import Foundation

protocol IAvardsScreenPresenter {
    var viewController: IAvardsScreenVC? { get set }
}

final class AvardsScreenPresenter: IAvardsScreenPresenter {
    weak var viewController: IAvardsScreenVC?
}
