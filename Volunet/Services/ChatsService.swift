//
//  ChatsService.swift
//  Volunet
//
//  Created by Софья Тимохина on 27.04.2022.
//

import Foundation
import MessengerKit

protocol IChatsService {
    func getChats(uuid: String, completion: @escaping (Result<[[MSGMessage]], Error>) -> Void)

    func sendMessage(uuid: String, message: MSGMessage, completion: @escaping (Result<Void, Error>) -> Void)
}

class ChatsService: IChatsService {
    func getChats(uuid: String, completion: @escaping (Result<[[MSGMessage]], Error>) -> Void) {
    }

    func sendMessage(uuid: String, message: MSGMessage, completion: @escaping (Result<Void, Error>) -> Void) {
    }
}
