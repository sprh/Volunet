//
//  ChatCollectionView.swift
//  Volunet
//
//  Created by Софья Тимохина on 25.04.2022.
//

import MessengerKit

class ChatCollectionView: MSGImessageCollectionView {
    override func registerCells() {
        super.registerCells()

        register(UINib(nibName: "CustomOutgoingTextCell", bundle: nil), forCellWithReuseIdentifier: "outgoingText")
        register(UINib(nibName: "CustomIncomingTextCell", bundle: nil), forCellWithReuseIdentifier: "incomingText")
    }
}
