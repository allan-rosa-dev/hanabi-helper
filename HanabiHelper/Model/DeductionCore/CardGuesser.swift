//
//  CardKnowledgeManager.swift
//  HanabiHelper
//
//  Created by Allan Clipes Rosa on 24/07/23.
//

import Foundation


class CardGuesser {
    // MARK: - Attributes
    let gameMode: GameMode
    private var colorKnowledge: [CardColor]
    private var numberKnowledge: [CardNumber]

    // MARK: - Init
    init(gameMode: GameMode) {
        self.gameMode = gameMode
        colorKnowledge = CardColor.allCases
        numberKnowledge = CardNumber.allCases
    }

    // MARK: - Methods
    func calculatePossbilities() -> [GameCard] {
        var possibleCards = [GameCard]()

        numberKnowledge.forEach { number in
            colorKnowledge.forEach { color in
                possibleCards.append(GameCard(color: color, number: number))
            }
        }
        return possibleCards
    }

    func giveHint(_ hint: Hint) {
        print("\(hint.description())")
        switch hint {
        case .color(isNegated: let isNegated, color: let color):
            if isNegated { assertFalse(for: color) }
            else { assertTrue(for: color) }
        case .number(isNegated: let isNegated, number: let number):
            if isNegated { assertFalse(for: number) }
            else { assertTrue(for: number) }
        }
    }

    // MARK: - Helper Functions
    private func assertTrue(for number: CardNumber) {
        guard numberKnowledge.count >= 1 else { return }
        numberKnowledge = numberKnowledge.filter { $0 == number }
    }

    private func assertTrue(for color: CardColor) {
        guard colorKnowledge.count >= 1 else { return }
        colorKnowledge = colorKnowledge.filter { $0 == color }
    }

    private func assertFalse(for number: CardNumber) {
        numberKnowledge = numberKnowledge.filter { $0 != number }
    }

    private func assertFalse(for color: CardColor) {
        switch gameMode {
        case .extraSuitWildcard:
            if color == .multicolor {
                print("Extra Suit Wildcard validation")
            }
        default:
            colorKnowledge = colorKnowledge.filter { $0 != color }
        }
    }
}
