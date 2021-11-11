//
//  String+Utils.swift
//  Volunet
//
//  Created by Софья Тимохина on 11.11.2021.
//

import Foundation

enum LocalizedStringsKeys: String {
    case registration
    case alreadyHaveAccount
    case signIn
    case join
    case name
    case email
    case password
    case confimPassword
    case volunteer
    case organizaton
    case volunteerOrganization
    case welcome
    
}

extension String {
    var localized: String {
        NSLocalizedString(self, comment: "")
    }

    static func getLocalizedString(for key: LocalizedStringsKeys) -> String {
        return key.rawValue.localized
    }
}
