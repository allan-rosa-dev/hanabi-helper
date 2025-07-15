//
//  Deck.swift
//  Hanabi-Brain
//
//  Created by Allan Rosa on 28/12/24.
//

import Foundation

class Deck {
    var cards: [Card]
    var discardPile: [Card]

    // MARK: - Init
	init(with config: GameConfig) {
        cards = generateDeck(with: config)
        discardPile = []
    }

    // MARK: - Methods
    func displayDeck() {
        cards.forEach { card in
            print(card.color, card.number, separator: ", ")
        }
    }

    func shuffle() {
        cards.shuffle()
    }

	func search(for card: Card) -> Card? {
		guard !cards.isEmpty else { return nil }
		return cards.first { $0 == card }
	}

    func draw() -> Card? {
        guard !cards.isEmpty, let topCard = cards.first else { return nil }
        cards.remove(at: 0)
        print("Your draw: [\(topCard.color), \(topCard.number)]")
        return topCard
    }
	
	func discard(_ card: Card) {
		discardPile.append(card)
	}
}

// MARK: - Helper Functions
fileprivate func generateDeck(with config: GameConfig) -> [Card] {
    var deck = [Card]()

    CardColor.allCases.forEach { color in
        switch color {
        case .blue, .green, .red, .yellow, .white:
            deck.append(contentsOf: generateCards(of: color))
//        case .multicolor:
//            switch gameMode {
//            case .regular:
//                break
//            case .extraSuitWildcard, .extraSuitFull:
//                deck.append(contentsOf: generateCards(of: color))
//            case .extraSuitSingle: // We manually append those because it's an exception of the deck generation rule
//                deck.append(contentsOf: [Card(color: .multicolor, number: .one),
//										 Card(color: .multicolor, number: .two),
//										 Card(color: .multicolor, number: .three),
//										 Card(color: .multicolor, number: .four),
//										 Card(color: .multicolor, number: .five)])
//            }
        }
    }

    return deck.shuffled()
}

fileprivate func generateCards(of color: CardColor) -> [Card] {
    var cards = [Card]()

    CardNumber.allCases.forEach { number in
        cards.append(contentsOf: [Card](repeating: Card(color: color, number: number), count: number.totalCount))
    }

    return cards
}
