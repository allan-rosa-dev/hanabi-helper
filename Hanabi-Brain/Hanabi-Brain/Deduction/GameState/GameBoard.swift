//
//  GameBoard.swift
//  Hanabi-Brain
//
//  Created by Allan Clipes Rosa on 24/06/25.
//

import Foundation

// Deck, Discard Pile, Play Pile
struct GameBoard {
    let gameConfig: GameConfig = GameConfig(mode: .regular, numberOfPlayers: .two)
    
    var deck: Deck
    var playedPile: PlayedPile
}
