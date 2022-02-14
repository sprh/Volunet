//
//  AvardsScreenInteractor.swift
//  Volunet
//
//  Created by Софья Тимохина on 14.02.2022.
//

import Foundation

protocol IAvardsScreenInterator {

}

final class AvardsScreenInterator: IAvardsScreenInterator {
    private let presenter: IAvardsScreenPresenter

    init(presenter: IAvardsScreenPresenter) {
        self.presenter = presenter
    }
}
