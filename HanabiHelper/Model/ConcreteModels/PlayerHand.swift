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
    var numberOfCardsInHand: Int
    var selectedCards: [Int]

    // MARK: - Init
    init(for config: GameConfiguration) {
        selectedCards = []
        numberOfCardsInHand = K.standard.getPlayerHandSize(for: config.numberOfPlayers)
        cards = [CardGuesser](repeating: CardGuesser(gameMode: config.gameMode), count: numberOfCardsInHand)
    }

    // MARK: - Methods
    func selectCards(in positions: [Int]) {
        print("Selecting cards in [\(positions.description)]")
        guard !positions.isEmpty, (0...numberOfCardsInHand).contains(positions) else { return }

        selectedCards = positions
    }

    func giveHint(_ hint: Hint) {
        selectedCards.forEach { position in
            cards[position].applyHint(hint)
        }
    }

    func playCard(in position: Int) {
        // Stub
    }

    func discardCard(in position: Int) {
        // Stub
    }
}

// MARK: - Equatable
extension PlayerHand: Equatable {
    static func == (lhs: PlayerHand, rhs: PlayerHand) -> Bool {
        let selectedEquals = lhs.selectedCards == rhs.selectedCards
        let cardsEquals = lhs.cards == rhs.cards

        return selectedEquals && cardsEquals
    }
}
