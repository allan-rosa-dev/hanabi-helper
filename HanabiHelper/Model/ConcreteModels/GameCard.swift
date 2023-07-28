//
//  HanabiCard.swift
//  HanabiHelper
//
//  Created by Allan Clipes Rosa on 17/07/23.
//

import Foundation

class GameCard: ObservableObject, Identifiable {
    // MARK: - Attributes
    let color: CardColor
    let number: CardNumber

    // MARK: - Init
    init(color: CardColor, number: CardNumber) {
        self.color = color
        self.number = number
    }

    // MARK: - Methods
    func description() -> String {
        return "[\(color.description()) \(number.description())]"
    }
}
