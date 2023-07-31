//
//  Hint.swift
//  HanabiHelper
//
//  Created by Allan Clipes Rosa on 28/07/23.
//

import Foundation

enum Hint {
    case color(isNormal: Bool, color: CardColor)
    case number(isNormal: Bool, number: CardNumber)

    var description: String {
        switch self {
        case .color(isNormal: let isNormal, color: let color):
            return isNormal ? "IS \(color)" : "NOT \(color)"
        case .number(isNormal: let isNormal, number: let number):
            return isNormal ? "IS \(number)" : "NOT \(number)"
        }
    }

    // MARK: - Methods
    mutating func toggle() {
        switch self {
        case .color(isNormal: let isNormal, color: let color):
            self = .color(isNormal: !isNormal, color: color)
        case .number(isNormal: let isNormal, number: let number):
            self = .number(isNormal: !isNormal, number: number)
        }
    }
}

// Adding because I needed to create a Picker that updates the Hint to be given (in GameView.swift)
extension Hint: Hashable {
    func hash(into hasher: inout Hasher) {
        switch self {
        case .color(isNormal: let isNormal, color: let color):
            hasher.combine(isNormal)
            hasher.combine(color)
        case .number(isNormal: let isNormal, number: let number):
            hasher.combine(isNormal)
            hasher.combine(number)
        }
    }
}

// MARK: - HintCategory
enum HintCategory: String, CaseIterable {

    case color = "Color"
    case number = "Number"
}

// MARK: HintType
enum HintType: String, CaseIterable {

    case normal = "Normal"
    case negated = "Negated"

    // MARK: - Methods
    func value() -> Bool {
        switch self {
        case .normal:
            return true
        case .negated:
            return false
        }
    }
}
