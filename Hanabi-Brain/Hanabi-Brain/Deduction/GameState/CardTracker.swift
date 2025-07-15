//
//  CardTracker.swift
//  Hanabi-Brain
//
//  Created by Allan Clipes Rosa on 24/06/25.
//

import Foundation

struct CardTracker {
    var color: CardColor
    
    var playedCards: [Card] = []
    var discardedCards: [Card] = []
    
    var top: Card? {
        playedCards.last
    }
    
    func count(of number: CardNumber) -> Int {
        return playedCards.filter { $0.number == number }.count + discardedCards.filter { $0.number == number }.count
    }
    
    mutating func play(_ card: Card) -> Bool {
        guard card.color == color else { return false }
        
        if playedCards.count == card.number.value - 1 {
            playedCards.append(card)
            return true
        } else {
            return false
        }
    }
    
    mutating func discard(_ card: Card) -> Bool {
        guard card.color == color else { return false }
        
        discardedCards.append(card)
        
        return true
    }
}
