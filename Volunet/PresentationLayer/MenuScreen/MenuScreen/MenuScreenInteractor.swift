//
//  MenuScreenInteractor.swift
//  Volunet
//
//  Created by Софья Тимохина on 13.03.2022.
//

import Foundation

protocol IMenuScreenInterator {
    // TODO: load image
}

final class MenuScreenInterator: IMenuScreenInterator {
    private let presenter: IMenuScreenPresenter
    private let profileStorage: IProfileStorage

    init(presenter: IMenuScreenPresenter, profileStorage: IProfileStorage) {
        self.presenter = presenter
        self.profileStorage = profileStorage
    }
}
