//
//  AvardsScreenInteractor.swift
//  Volunet
//
//  Created by Софья Тимохина on 14.02.2022.
//

import Foundation

protocol IAvardsScreenInterator {
    var avardsCount: Int { get }
    func getAvard(at index: Int) -> Avard
}

final class AvardsScreenInterator: IAvardsScreenInterator {
    private let presenter: IAvardsScreenPresenter
    private let profileStorage: IProfileStorage

    init(presenter: IAvardsScreenPresenter, profileStorage: IProfileStorage) {
        self.presenter = presenter
        self.profileStorage = profileStorage
    }

    var avardsCount: Int {
        profileStorage.profile?.avards?.count ?? 0
    }

    func getAvard(at index: Int) -> Avard {
        return profileStorage.profile?.avards?[index] ?? Avard(title: "", image: .close)
    }
}
