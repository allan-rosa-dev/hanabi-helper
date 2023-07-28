//
//  Hint.swift
//  HanabiHelper
//
//  Created by Allan Clipes Rosa on 28/07/23.
//

import Foundation

enum Hint {

    case color(isNegated: Bool, color: CardColor)
    case number(isNegated: Bool, number: CardNumber)

    // MARK: - Methods
    func description() -> String {
        switch self {
        case .color(isNegated: let isNegated, color: let color):
            return isNegated ? "NOT \(color)" : "IS \(color)"
        case .number(isNegated: let isNegated, number: let number):
            return isNegated ? "NOT \(number)" : "IS \(number)"
        }
    }
}
