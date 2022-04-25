//
//  Profile.swift
//  Volunet
//
//  Created by Софья Тимохина on 03.02.2022.
//

import Foundation

struct Profile {
    let uuid: Int
    let name: String
    let events: [UserEvent]
    let specialHealthFeatures: [String]
    let imageUrl: String
    let avards: [Avard]?
    let accountType: AccountType
}

enum AccountType: Int {
    case volunteer, organization
}

