//
//  GameMatch.swift
//  HanabiHelper
//
//  Created by Allan Clipes Rosa on 17/07/23.
//

import Foundation

class GameMatch: ObservableObject {
    var deck: Deck
    var hints: Int // Max. 8
    var strikes: Int // When Strikes reach 0 you lose
    var numberOfPlayers: Int = 2 // 2-5 Players -> 2-3P: 5 cards each | 4-5P: 4 cards each
    let gameMode: GameMode

    @Published var lastCard: GameCard?

    init(numberOfPlayers: Int, gameMode: GameMode) {
        self.deck = Deck(for: gameMode)
        self.hints = 8
        self.strikes = 3
        self.numberOfPlayers = numberOfPlayers
        self.gameMode = gameMode

        deck.shuffle()
    }

    func printDeck() {
        deck.displayDeck()
    }

    func playCard() {
        lastCard = deck.draw()
    }
}
