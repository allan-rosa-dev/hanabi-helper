//
//  HanabiCard.swift
//  HanabiHelper
//
//  Created by Allan Clipes Rosa on 17/07/23.
//

import Foundation

class GameCard: ObservableObject {
    let color: CardColor
    let number: CardNumber

    init(color: CardColor, number: CardNumber) {
        self.color = color
        self.number = number
    }
}
