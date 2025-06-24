//
//  Hint.swift
//  Hanabi-Brain
//
//  Created by Allan Rosa on 28/12/24.
//

import SwiftUI

struct Hint {
    var category: Category = .color
    var logic: Logic = .have
    var colorValue: CardColor = .white
    var numberValue: CardNumber = .one
    
    var opposite: Hint {
        switch logic {
        case .have: return Hint(category: category, logic: .dontHave, colorValue: colorValue, numberValue: numberValue)
        case .dontHave: return Hint(category: category, logic: .have, colorValue: colorValue, numberValue: numberValue)
        }
    }
}

extension Hint {
    enum Category: Identifiable, CaseIterable, Equatable, CustomStringConvertible {
        case color
        case number
        
        var id: Self { self }
        
        var description: String {
            switch self {
            case .color: return "color"
            case .number: return "number"
            }
        }
    }
    
    enum Logic: Identifiable, CaseIterable, Equatable, CustomStringConvertible {
        case have
        case dontHave
        
        var value: Bool {
            switch self {
            case .have: return true
            case .dontHave: return false
            }
        }
        
        var id: Self { self }
        var description: String {
            switch self {
            case .have: return "have"
            case .dontHave: return "don't have"
            }
        }
    }
}

extension Hint: CustomStringConvertible {
    var description: String {
        switch category {
        case .color:
            return "\(logic) \(colorValue)"
        case .number:
            return "\(logic) \(numberValue)"
        }
    }
}
