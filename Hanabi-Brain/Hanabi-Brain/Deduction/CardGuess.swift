//
//  CardGuess.swift
//  Hanabi-Brain
//
//  Created by Allan Rosa on 28/12/24.
//

import SwiftUI

class CardGuess: ObservableObject { 
    @Published var isSelected: Bool = false

	@Published var possibleNumbers = CardNumber.allCases
	@Published var possibleColors = CardColor.allCases
	
	var possibilities: [Card] {
		var possibleCards = [Card]()

		possibleNumbers.forEach { number in
			possibleColors.forEach { color in
				possibleCards.append(Card(color: color, number: number))
			}
		}
		return possibleCards
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
}

extension CardGuess {
	private func assert(have: Bool, number: CardNumber) {
		if have {
			possibleNumbers = possibleNumbers.filter { $0 == number }
		} else {
			possibleNumbers = possibleNumbers.filter { $0 != number }
		}
	}
	
	private func assert(have: Bool, color: CardColor) {
		if have {
			possibleColors = possibleColors.filter { $0 == color }
		} else {
			possibleColors = possibleColors.filter { $0 != color }
		}
	}
}

extension CardGuess: Identifiable {
    
}

// DebugPrint
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
