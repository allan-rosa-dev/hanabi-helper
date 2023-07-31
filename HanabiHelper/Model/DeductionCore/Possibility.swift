//
//  Possibility.swift
//  HanabiHelper
//
//  Created by Allan Clipes Rosa on 28/07/23.
//

import Foundation

enum Possibility {

    case correct
    case incorrect
    case unknown

    // MARK: - Methods
    var description: String {
        switch self {
        case .correct:
            return "☑️"
        case .incorrect:
            return "❎"
        case .unknown:
            return "💭"
        }
    }
}
