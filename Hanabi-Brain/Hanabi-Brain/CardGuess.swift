//
//  CardGuess.swift
//  Hanabi-Brain
//
//  Created by Allan Rosa on 28/12/24.
//

import Foundation

class CardGuess {
	
	var possibleNumbers = CardNumber.allCases
	var possibleColors = CardColor.allCases
	
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
		switch hint {
			case .colorHint(have: let have, color: let color):
				assert(have: have.value, color: color)
			case .numberHint(have: let have, number: let number):
				assert(have: have.value, number: number)
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
