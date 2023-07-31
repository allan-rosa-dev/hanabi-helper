//
//  CardNumber.swift
//  HanabiHelper
//
//  Created by Allan Clipes Rosa on 17/07/23.
//

import Foundation

enum CardNumber: CaseIterable, Equatable {

    case one, two, three, four, five
    case invalid

    static var allCases: [CardNumber] = [.one, .two, .three, .four, .five]

    // MARK: - Methods
    var description: String {
        switch self {
        case .one:
            return "1"
        case .two:
            return "2"
        case .three:
            return "3"
        case .four:
            return "4"
        case .five:
            return "5"
        case .invalid:
            return "?"
        }
    }
}
