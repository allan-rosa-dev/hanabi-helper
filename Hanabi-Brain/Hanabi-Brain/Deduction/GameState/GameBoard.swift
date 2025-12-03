//
//  GameBoard.swift
//  Hanabi-Brain
//
//  Created by Allan Clipes Rosa on 15/07/25.
//

import SwiftUI

class GameBoard: ObservableObject {
    
    @State var whiteTracker: CardTracker = CardTracker(
        color: .white,
        discardedCards: [
            Card(color: .white, number: .four),
            Card(color: .white, number: .four),
        ]
    )
    
    @State var redTracker: CardTracker = CardTracker(
        color: .red,
        playedCards: [],
        discardedCards: [
            Card(color: .red, number: .one),
            Card(color: .red, number: .one),
            Card(color: .red, number: .two),
            Card(color: .red, number: .five),
        ]
    )
    
    @State var greenTracker: CardTracker = CardTracker(
        color: .green,
        playedCards: [
            Card(color: .green, number: .one),
            Card(color: .green, number: .two),
            Card(color: .green, number: .three),
        ],
        discardedCards: [
            Card(color: .green, number: .one),
            Card(color: .green, number: .one),
            Card(color: .green, number: .five),
            Card(color: .green, number: .four),
            Card(color: .green, number: .four)
        ]
    )
    
    @State var blueTracker: CardTracker = CardTracker(
        color: .blue,
        discardedCards: [
            Card(color: .green, number: .one),
            Card(color: .green, number: .one),
            Card(color: .green, number: .one),
            Card(color: .green, number: .two),
            Card(color: .green, number: .two),
            Card(color: .green, number: .three),
            Card(color: .green, number: .three),
            Card(color: .green, number: .four),
            Card(color: .green, number: .four),
            Card(color: .green, number: .five),
        ]
    )
    
    @State var yellowTracker: CardTracker = CardTracker(color: .yellow) {
        didSet {
            print("yellow tracker changed")
        }
    }
    
    func tracker(of color: CardColor) -> CardTracker {
        switch color {
        case .red: redTracker
        case .white: whiteTracker
        case .blue: blueTracker
        case .yellow: yellowTracker
        case .green: greenTracker
        }
    }
    
    func play(card: Card) {
        var tracker = tracker(of: card.color)
        let isSuccessful = tracker.play(card)
        
        if !isSuccessful {
            discard(card: card, isIncorrectPlay: true)
        }
    }
    
    func discard(card: Card, isIncorrectPlay: Bool = false) {
//        var tracker = tracker(of: card.color)
        
        print("discarding a card, tracker will change")
//        tracker.discard(card)
        yellowTracker.discard(card)
    }
}

