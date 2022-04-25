//
//  Profile.swift
//  Volunet
//
//  Created by Софья Тимохина on 03.02.2022.
//

import Foundation
import MessengerKit

struct Profile: MSGUser {
    let uuid: Int
    let name: String
    let events: [UserEvent]
    let specialHealthFeatures: [String]
    let imageUrl: String
    let avards: [Avard]?
    let accountType: AccountType

    var displayName: String {
        name
    }

    var avatar: UIImage? {
        get {
            return nil
        } set {
            
        }
    }

    var isSender: Bool {
        ProfileStorage.shared.profile?.uuid == uuid
    }
}

enum AccountType: Int {
    case volunteer, organization
}

