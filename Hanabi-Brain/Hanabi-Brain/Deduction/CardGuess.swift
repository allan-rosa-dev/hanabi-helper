//
//  CardGuess.swift
//  Hanabi-Brain
//
//  Created by Allan Rosa on 28/12/24.
//

import SwiftUI

class CardGuess: ObservableObject { 
    @Published var isSelected: Bool
    @Published var isFocused: Bool

    @Published var possibleNumbers: [CardNumber]
    @Published var possibleColors: [CardColor]
	
	var possibilities: [Card] {
		var possibleCards = [Card]()

		possibleNumbers.forEach { number in
			possibleColors.forEach { color in
				possibleCards.append(Card(color: color, number: number))
			}
		}
		return possibleCards
	}
    
    init(isSelected: Bool = false, isFocused: Bool = false, possibleNumbers: [CardNumber] = CardNumber.allCases, possibleColors: [CardColor] = CardColor.allCases) {
        self.isSelected = isSelected
        self.isFocused = isFocused
        self.possibleNumbers = possibleNumbers
        self.possibleColors = possibleColors
    }
	
	func applyHint(_ hint: Hint) {
		print("Applying Hint: \(hint.description)")
        switch hint.category {
        case .color:
            assert(have: hint.logic.value, color: hint.colorValue)
        case .number:
            assert(have: hint.logic.value, number: hint.numberValue)
        }
    }
    
    func reverseHint(_ hint: Hint) {
        // TODO: Implement
    }
}

extension CardGuess {
	private func assert(have: Bool, number: CardNumber) {
        // TODO: - Implement Clue giving error / throw & handling
        guard possibleNumbers.count > 1 && possibleNumbers.contains(number) else { return }
		if have {
			possibleNumbers = possibleNumbers.filter { $0 == number }
		} else {
			possibleNumbers = possibleNumbers.filter { $0 != number }
		}
	}
	
	private func assert(have: Bool, color: CardColor) {
        // TODO: - Implement Clue giving error / throw & handling
        guard possibleColors.count > 1 && possibleColors.contains(color) else { return }
		if have {
			possibleColors = possibleColors.filter { $0 == color }
		} else {
			possibleColors = possibleColors.filter { $0 != color }
		}
	}
}

extension CardGuess: Identifiable {
    
}

// WIP - DebugPrint - marked for deletion
extension CardGuess {
    var description: String {
        var description = ""
        possibleColors.forEach { color in
            possibleNumbers.forEach { number in
                description += "\(number.description)\(color.description), "
            }
        }
        return description
    }
}
