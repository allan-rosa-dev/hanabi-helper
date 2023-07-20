//
//  GameView.swift
//  HanabiHelper
//
//  Created by Allan Clipes Rosa on 17/07/23.
//

import SwiftUI

struct GameView: View {
    @ObservedObject var gameMatch: GameMatch = GameMatch(numberOfPlayers: 2, gameMode: .regular)
    @State var text: String = "Nothing here yet"

    var body: some View {
        ZStack {
            // MARK: - Background Color
            K.backgroundColor
                .ignoresSafeArea()
            VStack {
                CardFrontView(card: gameMatch.lastCard)

                Button("Draw!") {
                    gameMatch.playCard()
                    text = "\(gameMatch.lastCard!.color) \(gameMatch.lastCard!.number)"
                }
                .padding()
                .foregroundColor(.white)
                .fontWeight(.black)
                .font(.title)
                .buttonBorderShape(ButtonBorderShape.capsule)
                
                Button("Print Deck") {
                    print("-- Deck has \(gameMatch.deck.cards.count) cards --")
                    gameMatch.printDeck()
                    print("__ Deck has \(gameMatch.deck.cards.count) cards __")
                }
                .padding()
                .foregroundColor(.yellow)
                .fontWeight(.black)
                .font(.headline)

                Text(text)
                    .foregroundColor(.white)
                    .padding()
            }
            .padding()
        }
    }
}

struct GameView_Previews: PreviewProvider {
    static let gameMatchMock = GameMatch(numberOfPlayers: 2, gameMode: .regular)

    static var previews: some View {
        GameView()
    }
}
