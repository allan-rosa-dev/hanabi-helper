//
//  CardKnowledgeManager.swift
//  HanabiHelper
//
//  Created by Allan Clipes Rosa on 24/07/23.
//

import Foundation

class CardGuesser: ObservableObject {

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

    func applyHint(_ hint: Hint) {
        print("\(hint.description)")
        switch hint {
        case .color(isNormal: let isNormal, color: let color):
            if isNormal { assertFalse(for: color) }
            else { assertTrue(for: color) }
        case .number(isNormal: let isNormal, number: let number):
            if isNormal { assertFalse(for: number) }
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

// MARK: - Equatable
extension CardGuesser: Equatable {
    static func == (lhs: CardGuesser, rhs: CardGuesser) -> Bool {
        return lhs.colorKnowledge == rhs.colorKnowledge && lhs.numberKnowledge == rhs.numberKnowledge
    }
}
