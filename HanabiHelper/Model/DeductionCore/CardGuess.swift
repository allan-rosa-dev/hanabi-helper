//
//  CardGuess.swift
//  HanabiHelper
//
//  Created by Allan Clipes Rosa on 25/07/23.
//

import Foundation

///
/// Holds info of a guess about a specific card. A guess is a <Possibility>, being either correct, incorrect or not definitive (unknown).
///
class CardGuess {
    
    // MARK: - Attributes
    let card: GameCard
    var mark: Possibility

    // MARK: - Init
    init(_ card: GameCard) {
        self.card = card
        mark = .unknown
    }
}
