//
//  CardColor.swift
//  HanabiHelper
//
//  Created by Allan Clipes Rosa on 17/07/23.
//

import SwiftUI

enum CardColor: CaseIterable, Equatable {

    case blue, green, red, white, yellow
    case multicolor // Only used in extra modes

    // MARK: - Methods
    var value: Color {
        switch self {
        case .blue:
            return .blue
        case .green:
            return .green
        case .red:
            return .red
        case .white:
            return .white
        case .yellow:
            return .yellow
        case .multicolor:
            return .mint
        }
    }

    var description: String {
        switch self {
        case .blue:
            return "Blue"
        case .green:
            return "Green"
        case .red:
            return "Red"
        case .white:
            return "White"
        case .yellow:
            return "Yellow"
        case .multicolor:
            return "Multicolor"
        }
    }
}
