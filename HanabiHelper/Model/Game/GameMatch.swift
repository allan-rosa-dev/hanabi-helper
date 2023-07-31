//
//  GameMatch.swift
//  HanabiHelper
//
//  Created by Allan Clipes Rosa on 17/07/23.
//

import Foundation

class GameMatch: ObservableObject {
    
    // MARK: - Attributes
    var deck: Deck
    var hints: Int // Max. 8
    var strikes: Int // When Strikes reach 0 you lose
    @Published var config: GameConfiguration

    @Published var playerHand: PlayerHand
    @Published var lastCard: GameCard?

    // MARK: - Init
    init(config: GameConfiguration = GameConfiguration(numberOfPlayers: 2)) {
        self.config = config
        self.deck = Deck(for: config.gameMode)
        self.hints = 8
        self.strikes = 3
        self.playerHand = PlayerHand(for: config)
        deck.shuffle()
    }

    // MARK: - Methods
    func printDeck() {
        deck.displayDeck()
    }

    // MARK: - Helper Functions
}
