//
//  Date+Utils.swift
//  Volunet
//
//  Created by Софья Тимохина on 19.04.2022.
//

import Foundation

extension Date {
    static var tomorrow: Date {
        Calendar.current.date(byAdding: .day, value: 1, to: Date())!
    }
}
