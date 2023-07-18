//
//  ContentView.swift
//  HanabiHelper
//
//  Created by Allan Clipes Rosa on 17/07/23.
//

import SwiftUI

struct ContentView: View {
    @State var gameMatch: GameMatch = GameMatch(numberOfPlayers: 2, gameMode: .regular)
    @State var text: String = "Nothing here yet"

    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
                .padding()

            Button("Draw!") {
                gameMatch.playCard()
                text = "\(gameMatch.lastCard!.color) \(gameMatch.lastCard!.number)"
            }
            .padding()

            Button("Print Deck") {
                gameMatch.printDeck()
            }
            .padding()

            Text(text)
                .textFieldStyle(.roundedBorder)
                .padding()
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static let gameMatchMock = GameMatch(numberOfPlayers: 2, gameMode: .regular)

    static var previews: some View {
        ContentView()
    }
}
