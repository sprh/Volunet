//
//  MainScreenInteractor.swift
//  Volunet
//
//  Created by Софья Тимохина on 12.11.2021.
//

import Foundation

protocol IMainScreenInterator {

}

final class MainScreenInterator: IMainScreenInterator {
    private let presenter: IMainScreenPresenter

    init(presenter: IMainScreenPresenter) {
        self.presenter = presenter
    }
}
