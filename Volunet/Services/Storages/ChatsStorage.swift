//
//  ChatsStorage.swift
//  Volunet
//
//  Created by Софья Тимохина on 27.04.2022.
//

import Foundation
import MessengerKit

protocol IChatsStorage {
    var chats: [[MSGMessage]] { get set }

    func updateChats(chats: [[MSGMessage]])
}

class ChatsStorage: IChatsStorage {
    var chats: [[MSGMessage]] = [[]]

    func updateChats(chats: [[MSGMessage]]) {
        self.chats = chats
    }
}
