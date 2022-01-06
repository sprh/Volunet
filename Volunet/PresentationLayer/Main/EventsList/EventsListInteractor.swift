//
//  EventsListScreenInteractor.swift
//  Volunet
//
//  Created by Софья Тимохина on 12.11.2021.
//

import Foundation

protocol IEventsListScreenInterator {

}

final class EventsListScreenInterator: IEventsListScreenInterator {
    private let presenter: IEventsListScreenPresenter

    init(presenter: IEventsListScreenPresenter) {
        self.presenter = presenter
    }
}
