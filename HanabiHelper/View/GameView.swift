//
//  GameView.swift
//  HanabiHelper
//
//  Created by Allan Clipes Rosa on 17/07/23.
//

import SwiftUI

struct GameView: View {
    // MARK: - Attributes
    @StateObject var gameMatch = GameMatch(config: GameConfiguration(numberOfPlayers: 2))

    // MARK: - Init
    init() {
    }

    // MARK: - Design
    var body: some View {
        ZStack {
            // MARK: - Background Color
            K.backgroundColor
                .ignoresSafeArea()
            VStack {
                CardView(card: gameMatch.lastCard)
                HintView()
            }
            .padding()
        }
    }
}

// MARK: - Preview
struct GameView_Previews: PreviewProvider {
    static let gameConfig = GameConfiguration(numberOfPlayers: 2, gameMode: .regular)
    static let gameMatchMock = GameMatch(config: gameConfig)

    static var previews: some View {
        GameView()
    }
}
