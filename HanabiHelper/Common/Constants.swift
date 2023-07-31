//
//  Constants.swift
//  HanabiHelper
//
//  Created by Allan Clipes Rosa on 19/07/23.
//

import SwiftUI

struct K {
    static let standard = K()
    // Design
    static let backgroundColor = Color.black
    static let componentBackgroundColor = Color("colors/component-background-color")

    func getPlayerHandSize(for numberOfPlayers: Int) -> Int {
        if numberOfPlayers == 2 || numberOfPlayers == 3 {
            return 5
        }
        else if numberOfPlayers == 4 || numberOfPlayers == 5 {
            return 4
        }
        return 0 // Error case - should never happen
    }
}
