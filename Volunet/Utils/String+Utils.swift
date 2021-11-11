//
//  String+Utils.swift
//  Volunet
//
//  Created by Софья Тимохина on 11.11.2021.
//

import Foundation

enum LocalizedStringsKeys: String {
    case registration = "Registration"
    case alreadyHaveAccount = "I already have an account"
    case signIn = "Sign in"
}

extension String {
    var localized: String {
        NSLocalizedString(self, comment: "")
    }

    static func getLocalizedString(for key: LocalizedStringsKeys) -> String {
        return key.rawValue.localized
    }
}
