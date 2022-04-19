//
//  NewEventScreenInteractor.swift
//  Volunet
//
//  Created by Софья Тимохина on 19.04.2022.
//

import Foundation

protocol INewEventScreenInterator {
}

final class NewEventScreenInterator: INewEventScreenInterator {
    private let presenter: INewEventScreenPresenter

    init(presenter: INewEventScreenPresenter) {
        self.presenter = presenter
    }
}
