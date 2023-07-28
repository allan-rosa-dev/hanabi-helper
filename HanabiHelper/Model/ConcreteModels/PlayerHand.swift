//
//  PlayerHand.swift
//  HanabiHelper
//
//  Created by Allan Clipes Rosa on 28/07/23.
//

import Foundation

class PlayerHand {
    // MARK: - Attributes
    let cards: [CardGuesser]

    // MARK: - Init
    init(numberOfPlayers: Int, gameMode: GameMode) {
        guard numberOfPlayers >= 2, numberOfPlayers <= 5 else {
            cards = []
            return
        }

        var numberOfCardsInHand: Int

        let range_2P_3P = 2...3
        let range_4P_5P = 4...5

        if range_2P_3P.contains(numberOfPlayers) {
            numberOfCardsInHand = 4
        }
        else {
            numberOfCardsInHand = 5
        }

        cards = [CardGuesser](repeating: CardGuesser(gameMode: gameMode), count: numberOfCardsInHand)
    }

    // MARK: - Methods
}
