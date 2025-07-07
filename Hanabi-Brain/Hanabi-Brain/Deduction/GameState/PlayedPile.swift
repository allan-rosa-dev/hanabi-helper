//
//  PlayedPile.swift
//  Hanabi-Brain
//
//  Created by Allan Clipes Rosa on 24/06/25.
//

import Foundation

struct PlayedPile {
    var color: CardColor
    
    var cards = [Card]()
    
    var top: Card? { cards.last }
    
    mutating func play(_ card: Card) -> Bool {
        guard card.color == color else { return false }
        
        if cards.count == card.number.value - 1 {
            cards.append(card)
            return true
        } else {
            return false
        }
    }
    
    
}
