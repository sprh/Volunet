//
//  EventInfoScreenInteractor.swift
//  Volunet
//
//  Created by Софья Тимохина on 12.11.2021.
//

import Foundation

protocol IEventInfoScreenInterator {

}

final class EventInfoScreenInterator: IEventInfoScreenInterator {
    private let presenter: IEventInfoScreenPresenter
    private let event: Event

    init(presenter: IEventInfoScreenPresenter, event: Event) {
        self.presenter = presenter
        self.event = event
    }
}
