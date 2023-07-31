//
//  GameConfiguration.swift
//  HanabiHelper
//
//  Created by Allan Clipes Rosa on 29/07/23.
//

import Foundation

class GameConfiguration: ObservableObject {

    // MARK: - Attributes
    let gameMode: GameMode
    let numberOfPlayers: Int

    // MARK: - Init
    init(numberOfPlayers: Int, gameMode: GameMode = .regular) {
        self.gameMode = gameMode

        var playerCount = numberOfPlayers
        guard playerCount >= 2 else {
            self.numberOfPlayers = 2
            return
        }
        guard playerCount <= 5 else {
            self.numberOfPlayers = 5
            return
        }
        self.numberOfPlayers = numberOfPlayers
    }
}
