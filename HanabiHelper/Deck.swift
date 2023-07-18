//
//  Deck.swift
//  HanabiHelper
//
//  Created by Allan Clipes Rosa on 17/07/23.
//

import Foundation

struct Deck {
    var cards: [GameCard]
    var discardPile: [GameCard]

    init(for gameMode: GameMode) {
        cards = generateDeck(for: gameMode)
        discardPile = []

//        switch gameMode {
//        case .extraSuitFull, .extraSuitWildcard:
//            let wildCards: [GameCard] = []
//            cards.append(contentsOf: wildCards)
//        case .extraSuitSingle:
//            let wildCards: [GameCard] = []
//            cards.append(contentsOf: wildCards)
//        default:
//            print("--")
//        }
    }

    func displayDeck() {
        cards.forEach { card in
            print(card)
        }
    }

    mutating func shuffle() {
        cards.shuffle()
    }

    mutating func draw() -> GameCard? {
        guard !cards.isEmpty, let topCard = cards.first else { return nil }
        cards.remove(at: 0)
        print(topCard)
        return topCard
    }
}

fileprivate func generateDeck(for gameMode: GameMode) -> [GameCard] {
    var deck = [GameCard]()

    GameColor.allCases.forEach { color in
        switch color {
        case .blue, .green, .red, .yellow, .white:
            deck.append(contentsOf: generateCards(of: color))
        case .multicolor:
            switch gameMode {
            case .regular:
                break
            case .extraSuitWildcard, .extraSuitFull:
                deck.append(contentsOf: generateCards(of: color))
            case .extraSuitSingle:
                deck.append(contentsOf: [GameCard(color: .multicolor, number: .one),
                                         GameCard(color: .multicolor, number: .two),
                                         GameCard(color: .multicolor, number: .three),
                                         GameCard(color: .multicolor, number: .four),
                                         GameCard(color: .multicolor, number: .five),
                                        ])
            }
        }
    }

    return deck
}

fileprivate func generateCards(of color: GameColor) -> [GameCard] {
    var cards = [GameCard]()

    GameNumber.allCases.forEach { number in
        switch number {
        case .one:
            cards.append(contentsOf: [GameCard](repeating: GameCard(color: color, number: number), count: 3))
        case .two, .three, .four:
            cards.append(contentsOf: [GameCard](repeating: GameCard(color: color, number: number), count: 2))
        case .five:
            cards.append(contentsOf: [GameCard](repeating: GameCard(color: color, number: number), count: 1))
        }
    }

    return cards
}
