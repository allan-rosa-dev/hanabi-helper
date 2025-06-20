//
//  Card.swift
//  Hanabi-Brain
//
//  Created by Allan Rosa on 28/12/24.
//

import Foundation

struct Card {
	// MARK: - Attributes
	let color: CardColor
	let number: CardNumber

	// MARK: - Init
	init(color: CardColor, number: CardNumber) {
		self.color = color
		self.number = number
	}
}

extension Card {
	var description: String {
		return "[\(color.description) \(number.description)]"
	}
}

extension Card: Identifiable {
	var id: String { color.description + number.description }
}

extension Card: Equatable {
	static func == (lhs: Card, rhs: Card) -> Bool {
		return (lhs.number == rhs.number) && (lhs.color == rhs.color)
	}
}

extension Card: Hashable {
	func hash(into hasher: inout Hasher) {
		hasher.combine(number)
		hasher.combine(color)
	}
}
