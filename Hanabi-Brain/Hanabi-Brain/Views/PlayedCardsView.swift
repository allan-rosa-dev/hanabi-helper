//
//  PlayedCardsView.swift
//  Hanabi-Brain
//
//  Created by Allan Clipes Rosa on 24/06/25.
//

import SwiftUI

struct PlayedCardsView: View {
    @EnvironmentObject var gameBoard: GameBoard
    
    var body: some View {
        Button("Test") {
            add(card: Card(color: .yellow, number: .one))
        }
        
        Grid(verticalSpacing: 20) {
            ForEach(CardNumber.allCases) { number in
                GridRow() {
                    Text(number.description)
                        .font(.system(size: 40))
                    
                    Grid(verticalSpacing: 5) {
                        ForEach(1...number.totalCount, id: \.self) { cardCount in
                            GridRow() {
                                ForEach(CardColor.allCases) { color in
                                    let numberOfSeenCards = gameBoard.tracker(of: color).count(of: number)
                                    let isUsed: Bool = numberOfSeenCards < cardCount
                                    
                                    Circle()
                                        .stroke(.black, lineWidth: 2)
                                        .fill(color.value)
                                        .frame(width: 20, height: 20)
                                        .opacity(isUsed ? 1 : 0.1)
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    
    func add(card: Card) {
        gameBoard.discard(card: card)
    }
}

#Preview() {
    let board = GameBoard()
    
    PlayedCardsView()
        .environmentObject(board)
}
