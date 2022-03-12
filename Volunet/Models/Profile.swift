//
//  Profile.swift
//  Volunet
//
//  Created by Софья Тимохина on 03.02.2022.
//

import Foundation

struct Profile {
    let uuid: String
    let name: String
    let events: [UserEvent]
    let specialHealthFeatures: [String]
    let imageUrl: String
    let avards: [Avard]?
}

enum AccountType: Int {
    case volunteer, organization
}

