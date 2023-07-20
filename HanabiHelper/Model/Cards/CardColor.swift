//
//  CardColor.swift
//  HanabiHelper
//
//  Created by Allan Clipes Rosa on 17/07/23.
//

import SwiftUI

enum CardColor: CaseIterable {
    case blue, green, red, white, yellow // Base
    case multicolor // Extra

    func color() -> Color {
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
}
